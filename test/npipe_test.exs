defmodule NPIPETest do
  use ExUnit.Case
  doctest NPIPE

  test "greets the world" do
    assert NPIPE.hello() == :world
  end
end
