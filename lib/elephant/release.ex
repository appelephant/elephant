defmodule Elephant.Release do
  @moduledoc """
  Módulo para executar migrations, rollback and seeds usando o binário da release.
  Exemplos:
    $ bin/elephant eval "Elephant.Release.migrate"
    $ bin/elephant eval "Elephant.Release.seed"
  """

  @app :elephant

  @spec migrate :: [{:ok, any, any}]
  def migrate do
    load_app()
    ensure_started()

    for repo <- repos() do
      {:ok, _fun_return, _apps} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  @spec rollback(atom(), any()) :: {:ok, any, any}
  def rollback(repo, version) do
    load_app()
    {:ok, _fun_return, _apps} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  @spec seed :: [{:ok, any, any}]
  def seed do
    load_app()
    ensure_started()

    for repo <- repos() do
      {:ok, _fun_return, _apps} = Ecto.Migrator.with_repo(repo, &eval_seed/1)
    end
  end

  defp eval_seed(repo) do
    repo
    |> Ecto.Migrator.migrations_path()
    |> Path.join("../seeds.exs")
    |> Code.eval_file()
  end

  defp repos do
    Application.fetch_env!(@app, :ecto_repos)
  end

  defp load_app do
    Application.load(@app)
  end

  defp ensure_started do
    Application.ensure_all_started(:ssl)
    Application.ensure_all_started(@app)
  end
end
