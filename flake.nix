{
  description = ''
  Gerenciamento para psicologia clínica. 100% digital
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs = inputs@{ self, nixpkgs, unstable, utils }:
  utils.lib.mkFlake rec {
    inherit self inputs;

    supportedSystems = [ "x86_64-linux" ];

    outputsBuilder = channels: with channels.unstable; {
      packages =
        let
          elephantDeps = import ./deps.nix { inherit lib beamPackages; };

          elephant = beamPackages.mixRelease {
            pname = "elephant-dev";
            src = ./.;
            version = "0.1.0";
            mixEnv = "dev";
            mixNixDeps = elephantDeps;
          };
        in {
          inherit (channels.nixpkgs) package-from-overlays;

          inherit elephant;

          ociImage =
            let
              alpine-elixir = dockerTools.pullImage {
                imageName = "bitwalker/alpine-elixir";
                imageDigest = "sha256:60b36117e173f5d0fb5dbc13fb1b49fc934f123fa7d56fc0ccc644c54f28bccb";
                sha256 = "0k2n0xzhnbj0vzxzk3a9773qscrqg8j0ha9swm48vsvgwbaah5p5";
              };

              startSh = writeShellScriptBin "start" ''
              #!/bin/sh

              /bin/elephant eval "Elephant.Release.migrate" && \
              /bin/elephant eval "Elephant.Release.seed" && \
              /bin/elephant start
              '';
            in
            dockerTools.buildImage {
              name = "elephant";
              tag = "latest";

              fromImage = alpine-elixir;

              contents = [ elephant startSh ];

              config = {
                Cmd = [ "start" ];
                WorkingDir = "/elephant";
              };
            };
          };

          devShell = channels.unstable.mkShell {
            name = "appelephant";
            buildInputs = [
              gnumake
              gcc
              readline
              openssl
              zlib
              libxml2
              curl
              libiconv
              elixir
              beamPackages.rebar3
              glibcLocales
              postgresql
              mix2nix
            ] ++ pkgs.lib.optional stdenv.isLinux [
              inotify-tools
            # observer gtk engine
            gtk-engine-murrine
          ]
          ++ pkgs.lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
            CoreFoundation
            CoreServices
          ]);

          # define shell startup command
          shellHook = ''
            # create local tmp folders
            mkdir -p .nix-mix
            mkdir -p .nix-hex

            mix local.hex --force --if-missing
            mix local.rebar --force --if-missing

            # to not conflict with your host elixir
            # version and supress warnings about standard
            # libraries
            export ERL_LIBS="$HEX_HOME/lib/erlang/lib"
            '';
          };
        };
      };
    }
