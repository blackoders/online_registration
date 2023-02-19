defmodule Registration.Vehicle do
  alias Static.StateCodes
  alias Registration.Customer
  def rc_template(rc_details) do
        name = rc_details[:name]
        aadhar = rc_details[:aadhar]
        vehicle_number = rc_details[:vehicle_number]
        state = String.upcase(rc_details[:state])

    rc =
"""
⌜---------------------------------------⌝
|     #{state} of TRANSPORT DEPARTMENT     |
|      CERTIFICATE OF REGISTRATION     |
| *-----*-----*-----*------*-----*-----*|
|                                       |
|   Vehicle Ownwer         #{name}      |
|     Owner aadhar         #{aadhar}    |
|   vehicle_number         #{vehicle_number} |
|                                       |
⌞---------------------------------------⌟

"""
      IO.puts(rc)


  end

  def vehicle_number_generation(state) do
    state_code = StateCodes.get_code(state)
    random_number = Enum.random(1_000..9_999)
    district_number = Enum.random(0_0..5_2)
    double_string = Registration.Vehicle.random_string
    "#{state_code} #{district_number} #{double_string} #{random_number}"
  end

  def random_string do
    alphabet = Enum.to_list(?a..?z)
    length = 2

    alphabet
    |> Enum.take_random(length)
    |> String.Chars.to_string()
    |> String.upcase()
  end

  def process do
   customer_info =  Customer.get_customer_data()
   vehicle_info =   StateCodes.select_state()
  vehicle_number =  vehicle_number_generation(vehicle_info[:state])



   name = customer_info[:name]
   aadhar = customer_info[:aadhar]
   state = vehicle_info[:state]
   IO.puts("\n\n RC is generating\n")
   rc_details = %{name: name,
                  aadhar: aadhar,
                  vehicle_number: vehicle_number,
                  state: state}
    receive do
    dummy ->
      :ok
     after
      20_00 ->
        rc = rc_template(rc_details)
    end

  end

end
