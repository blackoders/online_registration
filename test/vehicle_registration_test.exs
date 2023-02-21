defmodule Registration.VehicleTest do
  use ExUnit.Case

  setup_all do
    valid_vehicle = %{
      name: "sai",
      aadhar: "561664075050",
      state: "TamilNadu",
      vehicle_number: "TN 75 AA 7106",
      maker_class: "TATA",
      vehicle_class: "MOTOR CAR",
      fuel_used: "PETROL",
      type_of_body: "sedan"
    }

    invalid_vehicle = %{}
    {:ok, valid_vehicle: valid_vehicle, invalid_vehicle: invalid_vehicle}
  end

  test "valid vehicle", state do
    assert Registration.Vehicle.rc_generation(state[:valid_vehicle])
  end

  test "invalid vehicle", state do
    refute Registration.vehicle().rc_generation(state[:invalid_vehicle])
  end

  test "invalid by fuel used", state do
    valid_vehicle = state[:fuel_used]
    refute Registration.vehicle().rc_generation(%{valid_vehicle | fuel_used: "air"})
  end

  test "get_state_code", state do
  end
end
