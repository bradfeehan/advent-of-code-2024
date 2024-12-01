[Advent of Code 2024]
=====================

[Advent of Code 2024]: <https://adventofcode.com/2024/about>

TODO
----

- [x] Add mix tasks and documentation to README
    - [x] Fetch the puzzle text/story for a given day
        - Make sure it's not committed, it should be in the git ignore
        - Needs authentication, puzzles are revealed only as they're solved
    - [x] Fetch the puzzle "input" as a text file
        - Use the same auth
        - Again can't be committed to the repository
- [ ] Save problem statement as `index.html` instead of `README.md`
- [ ] Extract problem statement from HTML response -> `part1.md` and `part2.md` if present
    - Part 2 will be present in the response when available, and needs to be extracted to separate file
- [ ] Mix task for running a puzzle on its input and printing it in an inspectable format/user friendly
- [ ] Add tests for solved parts of problems or helper functions
    - [ ] Add tests for all sample inputs given in the problem statement
    - [ ] Use Elixir doctests?
- [ ] Add GitHub Actions workflows for CI
    - [ ] `mix test`
    - [ ] Formatting is standardised, i.e. running formatter doesn't result in any diff
    - [ ] Linting? Not sure what the standard is in Elixir
        - [ ] Shellcheck?
        - [ ] YAMLLint
        - [ ] JSON Schema (validates JSON/YAML etc have the correct fields)
        - [ ] Actionlint (detects issues in GitHub Actions workflows)
- [ ] Pre-commit hooks for linting
