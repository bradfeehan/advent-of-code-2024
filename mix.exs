defmodule AdventOfCode2024.MixProject do
  use Mix.Project

  def project do
    [
      app: :advent_of_code_2024,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :dotenv]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 2.2"},
      {:jason, "~> 1.4"},
      {:dotenv, "~> 3.1.0", runtime: false}
    ]
  end

  defp aliases do
    [
      "puzzle.fetch": &fetch_puzzle/1
    ]
  end

  defp fetch_puzzle(args) do
    Mix.Task.run("puzzle.fetch.text", args)
    Mix.Task.run("puzzle.fetch.input", args)
  end
end
