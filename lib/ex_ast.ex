defmodule ExAst do
  @moduledoc """
  Documentation for ExAst.
  """

  @doc """
  parses code and returns the ast.

  ## Examples

      iex> ExAst.parse("lib/examples/http_getter.ex")
      {:defmodule, [line: 1],
      [
        {:__aliases__, [line: 1], [:Examples, :HttpGetter]},
        [
          do: {:__block__, [],
          [
            {:import, [line: 2], [{:__aliases__, [line: 2], [:SweetXml]}]},
            {:def, [line: 3],
              [
                {:get, [line: 3], nil},
                [
                  do: {:__block__, [],
                  [
                    {{:., [line: 4],
                      [{:__aliases__, [line: 4], [:HTTPoison]}, :start]},
                      [line: 4], []},
                    {:|>, [line: 7],
                      [
                        {:|>, [line: 6],
                        [
                          {{:., [line: 5],
                            [{:__aliases__, [line: 5], [:HTTPoison]}, :get!]},
                            [line: 5],
                            ["https://en.wikipedia.org/wiki/Prospect_Park_(Brooklyn)"]},
                          {:body, [line: 6], nil}
                        ]},
                        {:parse_body, [line: 7], nil}
                      ]}
                  ]}
                ]
              ]},
            {:def, [line: 10],
              [
                {:body, [line: 10], [{:res, [line: 10], nil}]},
                [
                  do: {{:., [line: 11], [{:res, [line: 11], nil}, :body]},
                  [line: 11], []}
                ]
              ]},
            {:def, [line: 14],
              [
                {:parse_body, [line: 14], [{:body, [line: 14], nil}]},
                [
                  do: {:|>, [line: 15],
                  [
                    {:body, [line: 15], nil},
                    {:xpath, [line: 15],
                      [
                        {:sigil_x, [line: 15],
                        [
                          {:<<>>, [line: 15],
                            ["//span[text()='Overview']/following::p[descendant-or-self::text()]"]},
                          []
                        ]}
                      ]}
                  ]}
                ]
              ]}
          ]}
        ]
      ]}
  """
  def parse(file_name) do
    with {:ok, file} <- File.read(file_name),
         {:ok, ast} <- Code.string_to_quoted(file) do
      ast
    else {:error, error} ->
      error
    end
  end
end
