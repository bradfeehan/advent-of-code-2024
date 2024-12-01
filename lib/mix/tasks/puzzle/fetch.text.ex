defmodule Mix.Tasks.Puzzle.Fetch.Text do
  use Mix.Task
  alias Mix.Tasks.Puzzle.Fetch, as: BaseFetch

  @shortdoc "Fetch puzzle text for a specific day"

  @impl Mix.Task
  def run(args) do
    Application.ensure_all_started([:httpoison, :dotenv])

    {_opts, args, _} = OptionParser.parse(args, strict: [])
    day = BaseFetch.parse_day(List.first(args))
    token = BaseFetch.get_session_token()

    case get_puzzle_data(day, token) do
      {:ok, body} ->
        IO.puts("Puzzle text for day #{day}:")
        IO.puts(body)

      {:error, reason} ->
        Mix.raise("Failed to fetch puzzle text: #{reason}")
    end
  end

  defp get_puzzle_data(day, session_token) do
    BaseFetch.make_request("day/#{day}", session_token)
  end
end
