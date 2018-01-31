defmodule Examples.HttpGetter do
  import SweetXml
  def get do
    HTTPoison.start
    HTTPoison.get!("https://en.wikipedia.org/wiki/Prospect_Park_(Brooklyn)")
    |> body
    |> parse_body
  end

  def body(res) do
    res.body
  end

  def parse_body(body) do
    body |> xpath(~x"//span[text()='Overview']/following::p[descendant-or-self::text()]")
  end
end