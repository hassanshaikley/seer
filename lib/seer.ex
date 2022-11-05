defmodule Seer do
  import Plug.Conn

  @moduledoc """
  Plug that compares the path entered with available paths.
  Sorts all the path available in relation to the pathe entered by the Jaro Distance.
  """

  def init(default), do: default

  def call(conn, default) do
    target_path = conn.request_path

    project =
      Mix.Project.config()[:app]
      |> Atom.to_string()
      |> Kernel.<>("Web")
      |> Phoenix.Naming.camelize()
      |> String.to_atom()
      |> Module.concat(Router)

    routes = project.__routes__()

    routes =
      Enum.sort(routes, fn a, b ->
        String.jaro_distance(a.path, target_path) > String.jaro_distance(b.path, target_path)
      end)

    paths = Enum.map(routes, fn x -> x.path end)

    assign(conn, :seer, %{paths: paths})
  end
end
