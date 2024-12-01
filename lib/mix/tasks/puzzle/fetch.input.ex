defmodule Mix.Tasks.Puzzle.Fetch.Input do
  use Mix.Task
  alias Mix.Tasks.Puzzle.Fetch, as: BaseFetch

  @shortdoc "Fetch puzzle input for a specific day"

  @impl Mix.Task
  def run(args) do
    Application.ensure_all_started([:httpoison, :dotenv])

    {_opts, args, _} = OptionParser.parse(args, strict: [])
    day = BaseFetch.parse_day(List.first(args))
    token = BaseFetch.get_session_token()

    case get_puzzle_input(day, token) do
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

  defp get_puzzle_input(day, session_token) do
    BaseFetch.make_request("day/#{day}/input", session_token)
  end
end
