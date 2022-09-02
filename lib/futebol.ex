defmodule Futebol do
  @moduledoc """
  Documentation for Futebol.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Futebol.hello()
      :world

  """

  @base_url "https://api.api-futebol.com.br/v1/campeonatos/14/rodadas/28"
  @headers [
    Accept: "application/json",
    Authorization: "Bearer test_a51707e2019b9da11a931c4a8341f3"
  ]

  def futebol_info do
    {:ok, response} = HTTPoison.get(@base_url, @headers)
    {:ok, body} = Jason.decode(response.body)

    %{"partidas" => partidas} = body

    lista_placar = Enum.map(partidas, fn partida -> partida["placar"] end)

    publicacao = Enum.join(lista_placar, "\n")

    ExTwitter.update(publicacao)
  end
end

# headers = ["Accept": "application/json", "Authorization": "Bearer test_a51707e2019b9da11a931c4a8341f3"]
# url = "https://api.api-futebol.com.br/v1/campeonatos/14/rodadas/28"
# HTTPoison.get(url, headers)
# {:ok, response} =  HTTPoison.get(url, headers)
# response.body
# Jason.decode(response.body)
# {:ok, body} = Jason.decode(response.body)
#
