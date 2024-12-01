defmodule Mix.Tasks.Puzzle.Fetch do
  @moduledoc """
  Base module for fetching Advent of Code puzzle data.
  """

  @external_resource ".env"
  _ = Dotenv.load()

  @aoc_url "https://adventofcode.com"
  @year "2024"

  def setup_and_parse_args(args) do
    Application.ensure_all_started([:httpoison, :dotenv])
    {_opts, args, _} = OptionParser.parse(args, strict: [])
    day = parse_day(List.first(args))
    token = get_session_token()
    {day, token}
  end

  def get_puzzle_data(day, session_token) do
    make_request("#{@aoc_url}/#{@year}/day/#{day}", session_token)
  end

  @spec make_request(any(), any()) :: {:error, <<_::64, _::_*8>>} | {:ok, any()}
  def make_request(path, session_token) do
    url = "#{@aoc_url}/#{@year}/#{path}"

    headers = [
      {"Cookie", "session=#{session_token}"},
      {"User-Agent", "github.com/bradfeehan/advent_of_code_2024"}
    ]

    case HTTPoison.get(url, headers) do
      {:ok, %{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %{status_code: status, body: body}} ->
        error_msg = """
        HTTP #{status}
        URL: #{url}
        Response body: #{String.slice(body, 0, 1000)}
        """

        {:error, error_msg}

      {:error, %HTTPoison.Error{reason: reason}} ->
        error_msg = """
        Request failed
        URL: #{url}
        Reason: #{inspect(reason)}
        """

        {:error, error_msg}
    end
  end

  def ensure_puzzle_dir!(day) do
    dir = get_puzzle_dir(day)
    File.mkdir_p!(dir)
    dir
  end

  def get_puzzle_dir(day) do
    "puzzles/#{String.pad_leading("#{day}", 2, "0")}"
  end

  def get_session_token do
    System.get_env("AOC_SESSION_TOKEN") ||
      raise "Please set the AOC_SESSION_TOKEN environment variable"
  end

  def parse_day(nil) do
    # Default to current day if within December 1-25, otherwise error
    today = Date.utc_today()

    if today.month == 12 and today.day in 1..25 do
      today.day
    else
      raise "Please specify a day (1-25)"
    end
  end

  def parse_day(day) when is_binary(day) do
    case Integer.parse(day) do
      {day, ""} when day in 1..25 -> day
      _ -> raise "Day must be a number between 1 and 25"
    end
  end

  def write_file!(day, filename, contents) do
    dir = ensure_puzzle_dir!(day)
    path = Path.join(dir, filename)
    File.write!(path, contents)
    path
  end
end
