defmodule Mix.Tasks.Ecarg do
  use Mix.Task

  @shortdoc "Gestione versione Ecarg"

  @moduledoc """
  Prints Ecarg tasks and their information.
      $ mix Ecarg
  To print the Ecarg version, pass `-v` or `--version`, for example:
      $ mix Ecarg --version
  """

  @version Mix.Project.config()[:version]

  @impl true
  @doc false
  def run([opzione]) when opzione in ~w(-v --version) do
    Mix.shell().info("Ecarg v#{@version}")
  end

  @impl true
  @doc false
  def run([opzione]) when opzione in ~w(-awv --allinea) do
    old = File.read!("VERSION")
    new_version = "v#{@version}"
    File.write!("VERSION", new_version)
    modifica_readme(old)
    Mix.shell().info("VERSION era #{old} -> Ecarg #{new_version}")
  end

  @impl true
  @doc false
  def run([opzione]) when opzione in ~w(-a --app) do
    Mix.shell().info("App Ecarg v#{@version}")
  end

  def run(args) do
    case args do
      [] -> general()
      _ -> Mix.raise("Invalid arguments, expected: mix Ecarg")
    end
  end

  defp general() do
    Application.ensure_all_started(:Ecarg)
    Mix.shell().info("Gestione versione")
    Mix.shell().info("Ecarg v#{Application.spec(:Ecarg, :vsn)}")
    Mix.shell().info("\n## Options\n")
    Mix.shell().info("-v, --version        # Prints     Ecarg version\n")
    Mix.shell().info("-awv DO NOT USE      # Allinea    Ecarg version\n")
    Mix.Tasks.Help.run(["--search", "phx."])
  end

  defp modifica_readme(da_version) do
    v_elimnata = String.slice(da_version, 1, 50)
    con_readme = File.read!("README.md")
    new_version = String.replace(con_readme, v_elimnata, @version)
    File.write!("README.md", new_version)
    Mix.shell().info("Modificato README.md")
  end
end
