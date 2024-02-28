defmodule Pedro.View do
  require EEx
  alias Pedro.Controller

  def render(conn, file, assigns) do
    contents =
      file
      |> html_file_path()
      |> EEx.eval_file(assigns: assigns)

    Controller.render(conn, :html, contents)
  end

  defp html_file_path(file) do
    templates_path()
    |> Path.join(file)
  end

  defp templates_path() do
    case Application.fetch_env(:pedro, :templates_path) do
      {:ok, path} -> path
      :error -> raise ":templates_path not configured for views"
    end
  end
end
