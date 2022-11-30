defmodule ElixirBasicTest do
  use ExUnit.Case
  doctest ElixirBasic

  test "greets the world" do
    assert ElixirBasic.hello() == :world
  end
end
