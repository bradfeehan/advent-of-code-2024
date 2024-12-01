defmodule Mix.Tasks.Puzzle.Fetch.Text do
  use Mix.Task
  alias Mix.Tasks.Puzzle.Fetch, as: BaseFetch

  @shortdoc "Fetch puzzle text for a specific day"

  @impl Mix.Task
  def run(args) do
    {day, token} = BaseFetch.setup_and_parse_args(args)

    case fetch_puzzle_text(day, token) do
      {:ok, body} ->
        IO.puts("Puzzle text for day #{day}:")
        IO.puts(body)

      {:error, reason} ->
        Mix.raise("Failed to fetch puzzle text: #{reason}")
    end
  end

  defp fetch_puzzle_text(day, session_token) do
    BaseFetch.make_request("day/#{day}", session_token)
  end
end
