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
    Regex.match?(~r/^([a-zA-Z]{3,30})/, name)

  end

  @spec check_aadhar(any) :: false | nil | true
  def check_aadhar(aadhar) do
    Regex.match?(~r/^([0-9]{12}$)/, aadhar)

  end

  def get_data_from_customer do
    name = IO.gets("name with min 3'cha\n")
    aadhar = IO.gets("enter your aadahr number\n")
    customer_data = %{name: name, aadhar: aadhar}
   if Registration.Customer.is_valid(customer_data) do

     IO.puts  "your KYC is successfully updated."
     else
      IO.puts "Please check the details you have entered and try again!\n\n"
       Registration.Customer.get_data_from_customer

   end

end



end
