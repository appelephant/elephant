{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    bunt = buildMix rec {
      name = "bunt";
      version = "0.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0lw3v9kwbbcy1v6ygziiky887gffwwmxvyg4r1v0zm71kzhcgxbs";
      };

      beamDeps = [];
    };

    castore = buildMix rec {
      name = "castore";
      version = "0.1.17";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1yb3470p0mfawdy34gaa5lkhqrb8d35jai9235snxljjxlkl516r";
      };

      beamDeps = [];
    };

    connection = buildMix rec {
      name = "connection";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1746n8ba11amp1xhwzp38yfii2h051za8ndxlwdykyqqljq1wb3j";
      };

      beamDeps = [];
    };

    cowboy = buildErlangMk rec {
      name = "cowboy";
      version = "2.9.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1phv0a1zbgk7imfgcm0dlacm7hbjcdygb0pqmx4s26jf9f9rywic";
      };

      beamDeps = [ cowlib ranch ];
    };

    cowboy_telemetry = buildRebar3 rec {
      name = "cowboy_telemetry";
      version = "0.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1pn90is3k9dq64wbijvzkqb6ldfqvwiqi7ymc8dx6ra5xv0vm63x";
      };

      beamDeps = [ cowboy telemetry ];
    };

    cowlib = buildRebar3 rec {
      name = "cowlib";
      version = "2.11.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1ac6pj3x4vdbsa8hvmbzpdfc4k0v1p102jbd39snai8wnah9sgib";
      };

      beamDeps = [];
    };

    credo = buildMix rec {
      name = "credo";
      version = "1.6.4";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1drn8l9fwzpmqfssjmrcgzl51nx8jdrfymm0zydq5zz1c45r33y2";
      };

      beamDeps = [ bunt file_system jason ];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.4.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0s1nx1gi96r8g7x8y7cklz8z823a6llh4fk996i5xxcr3flkrrag";
      };

      beamDeps = [ connection telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "2.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0xzm8hfhn8q02rmg8cpgs68n5jz61wvqg7bxww9i1a6yanf6wril";
      };

      beamDeps = [];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.8.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1cwrcmni3g24cs9wm5yx55q443sfslqq65bc8slacq9zq8n93qmg";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.8.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "09a5jvkz2daffbqlgsmg7ivsszmjbmfk2ix0xhn6zkpdh9ccfzxs";
      };

      beamDeps = [ db_connection ecto postgrex telemetry ];
    };

    esbuild = buildMix rec {
      name = "esbuild";
      version = "0.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0iyls6ns09d46pxjmh3xk1kpr9hicbg24nkmwi75xr7zj9mlw7mn";
      };

      beamDeps = [ castore ];
    };

    file_system = buildMix rec {
      name = "file_system";
      version = "0.2.10";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1p0myxmnjjds8bbg69dd6fvhk8q3n7lb78zd4qvmjajnzgdmw6a1";
      };

      beamDeps = [];
    };

    floki = buildMix rec {
      name = "floki";
      version = "0.32.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "18w1qv9syz464914d61q3imryqgwxqbc0g0ygczlly2a7rqirffl";
      };

      beamDeps = [ html_entities ];
    };

    gettext = buildMix rec {
      name = "gettext";
      version = "0.19.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08kjwyc48sl69as1h3db17qy64bmjh31q1lvpanrk0ibj705dihh";
      };

      beamDeps = [];
    };

    html_entities = buildMix rec {
      name = "html_entities";
      version = "0.5.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1k7xyj0q38ms3n5hbn782pa6w1vgd6biwlxr4db6319l828a6fy5";
      };

      beamDeps = [];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.3.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1b620901micds3q2pfnwcp861hjiwx0wpyahgvnf142k4m8izz2k";
      };

      beamDeps = [ decimal ];
    };

    mime = buildMix rec {
      name = "mime";
      version = "2.0.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1dzrymni4zzr36mxb2b1hk1s92vp833a489fdkikjxr79imzg8z6";
      };

      beamDeps = [];
    };

    phoenix = buildMix rec {
      name = "phoenix";
      version = "1.6.8";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0wcz7scw172m4pwng3l3z8pqavy0p1w907zwvndh2plwxdm62kcz";
      };

      beamDeps = [ jason phoenix_pubsub phoenix_view plug plug_cowboy plug_crypto telemetry ];
    };

    phoenix_ecto = buildMix rec {
      name = "phoenix_ecto";
      version = "4.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1h9wnjmxns8y8dsr0r41ks66gscaqm7ivk4gsh5y07nkiralx1h9";
      };

      beamDeps = [ ecto phoenix_html plug ];
    };

    phoenix_html = buildMix rec {
      name = "phoenix_html";
      version = "3.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ky5idgid1psz6hmh2b2kmj6n974axww74hrxwv02p6jasx9gv1n";
      };

      beamDeps = [ plug ];
    };

    phoenix_live_dashboard = buildMix rec {
      name = "phoenix_live_dashboard";
      version = "0.6.5";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0lmq1m7k465i9mzw35l7bx69n85mibwzd76976840r43sw6sakzg";
      };

      beamDeps = [ ecto mime phoenix_live_view telemetry_metrics ];
    };

    phoenix_live_reload = buildMix rec {
      name = "phoenix_live_reload";
      version = "1.3.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1b5blinpmzdgspgk0dsy01bfjwwnhikb1gfiwnx8smazdrkrcrvn";
      };

      beamDeps = [ file_system phoenix ];
    };

    phoenix_live_view = buildMix rec {
      name = "phoenix_live_view";
      version = "0.17.9";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0ma47dlpsbrgrgknkd89dndabazxvcfr0v7djrlnnpqcpbhc7szp";
      };

      beamDeps = [ jason phoenix phoenix_html telemetry ];
    };

    phoenix_pubsub = buildMix rec {
      name = "phoenix_pubsub";
      version = "2.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1nfqrmbrq45if9pgk6g6vqiply2sxc40is3bfanphn7a3rnpqdl1";
      };

      beamDeps = [];
    };

    phoenix_view = buildMix rec {
      name = "phoenix_view";
      version = "1.1.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0mis1z24wmd78sfpiik2f0ypqsjisbhn3fxdyrk14289gg90msbs";
      };

      beamDeps = [ phoenix_html ];
    };

    plug = buildMix rec {
      name = "plug";
      version = "1.13.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1zrlg9k1h17x3pw9zyy4cg593iakpy2647gk57495kjvjnwwdf82";
      };

      beamDeps = [ mime plug_crypto telemetry ];
    };

    plug_cowboy = buildMix rec {
      name = "plug_cowboy";
      version = "2.5.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0i0hxbpkbgv2zi4z04x0l207dgbks2kj4h6kr1h8sq68fkvqfvpa";
      };

      beamDeps = [ cowboy cowboy_telemetry plug ];
    };

    plug_crypto = buildMix rec {
      name = "plug_crypto";
      version = "1.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1nxnxj62iv4yvm4771jbxpj3l4brn2crz053y12s998lv5x1qqw7";
      };

      beamDeps = [];
    };

    postgrex = buildMix rec {
      name = "postgrex";
      version = "0.16.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "142535k22dl5zdq757fhmnih7kk4lnq43llhzvjs8b9js79f3amf";
      };

      beamDeps = [ connection db_connection decimal jason ];
    };

    ranch = buildRebar3 rec {
      name = "ranch";
      version = "1.8.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1rfz5ld54pkd2w25jadyznia2vb7aw9bclck21fizargd39wzys9";
      };

      beamDeps = [];
    };

    swoosh = buildMix rec {
      name = "swoosh";
      version = "1.6.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1pl0b4y1ic8b4c2fd1qypgrb5yia0ympcdlrhj2g0hnlxw374b79";
      };

      beamDeps = [ cowboy jason mime plug_cowboy telemetry ];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0j6zq3y7xz768djz25x55gampyhd9nv6ax9dzx67f52nyyhv49xp";
      };

      beamDeps = [];
    };

    telemetry_metrics = buildMix rec {
      name = "telemetry_metrics";
      version = "0.6.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1iilk2n75kn9i95fdp8mpxvn3rcn3ghln7p77cijqws13j3y1sbv";
      };

      beamDeps = [ telemetry ];
    };

    telemetry_poller = buildRebar3 rec {
      name = "telemetry_poller";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0vjgxkxn9ll1gc6xd8jh4b0ldmg9l7fsfg7w63d44gvcssplx8mk";
      };

      beamDeps = [ telemetry ];
    };
  };
in self

