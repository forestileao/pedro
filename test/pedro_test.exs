defmodule PedroTest do
  use ExUnit.Case
  doctest Pedro

  test "greets the world" do
    assert Pedro.hello() == :world
  end
end
