defmodule Registration.Customer do
  @spec is_valid(%{:aadhar => any, :name => binary, optional(any) => any}) :: nil | true


  def is_valid(%{name: _name, aadhar: _aadhar} = customer_details) do
    %{name: name, aadhar: aadhar} = customer_details

    check_name(name) && check_aadhar(aadhar)
  end
  def is_valid(_any_customer_format) do
    false
  end
  @spec check_name(binary) :: false | nil | true
  def check_name(name) do
    IO.inspect(name)
    Regex.match?(~r/^([a-zA-Z]{3,30})/, name)

  end

  @spec check_aadhar(any) :: false | nil | true
  def check_aadhar(aadhar) do
    IO.inspect(aadhar)
    Regex.match?(~r/^([0-9]{12}$)/, aadhar)

  end
end
