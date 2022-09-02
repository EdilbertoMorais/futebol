defmodule FutebolTest do
  use ExUnit.Case
  doctest Futebol

  test "greets the world" do
    assert Futebol.hello() == :world
  end
end
