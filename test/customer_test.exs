defmodule Registration.CustomerTest do
  use ExUnit.Case
  doctest Registration.Customer

  setup_all do
    valid_customer = %{name: "boy", aadhar: "561664075050"}
    invalid_customer= %{}

    {:ok, valid_customer: valid_customer, invalid_customer: invalid_customer}
  end

  test "valid customer", state do
    assert Registration.Customer.is_valid(state[:valid_customer])
  end

  test "invalid customer", state do
    refute Registration.Customer.is_valid(state[:invalid_customer])
  end

  test "invalid by name", state do
    valid_customer = state[:valid_customer]

    invalid_customer_by_name = %{valid_customer | name: "ra"}
    refute Registration.Customer.is_valid(invalid_customer_by_name)

    invalid_customer_by_name = %{valid_customer | name: "1bor"}
    refute Registration.Customer.is_valid(invalid_customer_by_name)

  end

    test "invalid by aadhar", state do
      valid_customer = state[:valid_customer]

      invalid_customer_by_aadhar = %{valid_customer | aadhar: "abcsruchrt2d"}
      refute Registration.Customer.is_valid(invalid_customer_by_aadhar)

      invalid_customer_by_aadhar = %{valid_customer | aadhar: "1234"}
      refute Registration.Customer.is_valid(invalid_customer_by_aadhar)

      invalid_customer_by_aadhar = %{valid_customer | aadhar: "12345678901234"}
      refute Registration.Customer.is_valid(invalid_customer_by_aadhar)

    end

end
