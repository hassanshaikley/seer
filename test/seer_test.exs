defmodule SeerTest do
  use ExUnit.Case
  doctest Seer

  test "greets the world" do
    assert Seer.hello() == :world
  end
end
