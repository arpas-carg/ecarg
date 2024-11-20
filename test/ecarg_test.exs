defmodule EcargTest do
  use ExUnit.Case
  doctest Ecarg

  test "greets the world" do
    assert Ecarg.hello() == :world
  end
end
