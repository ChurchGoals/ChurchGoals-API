defmodule CG.MixProject do
  use Mix.Project

  def project do
    [
      app: :cg,
      version: "0.0.0",
      elixir: "1.9.1",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      name: "Church Goals API",
      source_url: "https://github.com/ChurchGoals/ChurchGoals-API",
      homepage_url: "https://www.churchgoals.net",
      docs: [
        main: "CG.Application",
        logo: "./logo.png",
        extras: ["README.md"]
      ],
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {CG.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :ex_machina
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.10"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:postgrex, ">= 0.0.0"},
      {:gettext, "~> 0.11"},
      {:credo, "~> 1.1"},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_machina, "~> 2.3"},
      {:absinthe_ecto, "~> 0.1"},
      {:absinthe_plug, "~> 1.4"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "coveralls", "test"]
    ]
  end
end
