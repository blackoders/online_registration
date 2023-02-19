defmodule Registration.Vehicle do
  import Static.StateCodes

  def rc_generation() do
    "isudhvskvjkfvkj                                 sh\n
    dljvsdjlfnvlnvn                                   \n
    h"
  end

  def vehicle_number_generation(state) do
    state_code = get_code(state)
    random_number = Enum.random(1_000..9_999)
    district_number = Enum.random(0_0..5_2)
    double_string = Registration.Vehicle.random_string()
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

  def input_from_ownwer do
  end
end
