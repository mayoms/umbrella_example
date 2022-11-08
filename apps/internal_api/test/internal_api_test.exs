defmodule InternalAPITest do
  use ExUnit.Case
  doctest InternalAPI

  test "greets the world" do
    assert InternalAPI.hello() == :world
  end
end
