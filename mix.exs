defmodule Pedro.MixProject do
  use Mix.Project

  def project do
    [
      app: :pedro,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
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
      {:jason, "~> 1.2.2"},
      {:plug, "~> 1.12.1"},
      {:plug_pedro_http_server, git: "https://github.com/forestileao/plug_pedro_http.git", tag: "main"}
    ]
  end
end
