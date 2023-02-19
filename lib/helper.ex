defmodule Registration.Helper do
  def read_string(prompt) do
    input = IO.gets(prompt)
    String.trim(input)
  end

  def read_integer(prompt) do
    input = IO.gets(prompt)
    String.trim(input)
  end
end
