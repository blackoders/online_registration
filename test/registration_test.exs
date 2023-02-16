defmodule RegistrationTest do
  use ExUnit.Case
  doctest Registration

  test "greets the world" do
    assert Registration.hello() == :world
  end
end
