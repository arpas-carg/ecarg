defmodule Ecarg.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :ecarg,
      version: @version,
      description: description(),
      package: package(),
      docs: docs(),
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end
  defp docs do
    [
      main: "Ecarg",
      source_ref: "v#{@version}",
      source_url: "https://github.com/alai-arpas/ecarg"
    ]
  end

  defp description do
    "Progetto CARG"
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/alai-arpas/ecarg"}
    ]
  end

  defp aliases do
    [
      awv: ["ecarg -awv"]
    ]
  end
end
