defmodule TaskRabbitTest do
  use ExUnit.Case
  doctest TaskRabbit

  test "greets the world" do
    assert TaskRabbit.hello() == :world
  end
end
