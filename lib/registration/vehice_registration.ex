defmodule Registration.Vehicle do
  import Static.StateCodes

  def rc_generation(params) do
  end

  def vehicle_number_generation(state) do
    state_code = get_code(state)
    random_number = Enum.random(1_000..9_999)
    district_number = Enum.random(0_0..5_2)
    "#{state_code} #{district_number} #{random_number}"
  end

  def random_vehicle_number do
  end
end
