defmodule Mix.Tasks.Puzzle.Fetch.Input do
  use Mix.Task
  alias Mix.Tasks.Puzzle.Fetch, as: BaseFetch

  @shortdoc "Fetch puzzle input for a specific day"

  @impl Mix.Task
  def run(args) do
    {day, token} = BaseFetch.setup_and_parse_args(args)

    case fetch_puzzle_input(day, token) do
      {:ok, input} ->
        # Ensure the inputs directory exists
        File.mkdir_p!("puzzles/inputs")

        # Save to file
        filename = "puzzles/inputs/day_#{String.pad_leading("#{day}", 2, "0")}.txt"
        File.write!(filename, input)
        IO.puts("Puzzle input saved to #{filename}")

      {:error, reason} ->
        Mix.raise("Failed to fetch puzzle input: #{reason}")
    end
  end

  defp fetch_puzzle_input(day, session_token) do
    BaseFetch.make_request("day/#{day}/input", session_token)
  end
end
