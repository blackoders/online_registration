defmodule Static.StateCodes do
  import Registration.Helper, only: [read_string: 1]

  def get_state_code do
    %{
      1 => %{index: 1, state: "Andaman_and_Nicobar", code: "AN"},
      2 => %{index: 2, state: "Andhra_Pradesh", code: "AP"},
      3 => %{index: 3, state: "Arunachal_Pradesh", code: "AR"},
      4 => %{index: 4, state: "Assam", code: "AS"},
      5 => %{index: 5, state: "Bihar", code: "BR"},
      6 => %{index: 6, state: "Chandigarh", code: "CH"},
      7 => %{index: 7, state: "Dadra_and_Nagar_Haveli", code: "DN"},
      8 => %{index: 8, state: "Daman_and_Diu", code: "DD"},
      9 => %{index: 9, state: "Delhi", code: "DL"},
      10 => %{index: 10, state: "Goa", code: "GA"},
      11 => %{index: 11, state: "Gujarat", code: "GJ"},
      12 => %{index: 12, state: "Haryana", code: "HR"},
      13 => %{index: 13, state: "Himachal_Pradesh", code: "HP"},
      14 => %{index: 14, state: "Jammu_and_Kashmir", code: "JK"},
      15 => %{index: 15, state: "Karnataka", code: "KA"},
      16 => %{index: 16, state: "Kerala", code: "KL"},
      17 => %{index: 17, state: "Lakshadweep", code: "LD"},
      18 => %{index: 18, state: "Madhya_Pradesh", code: "MP"},
      19 => %{index: 19, state: "Maharashtra", code: "MH"},
      20 => %{index: 20, state: "Manipur", code: "MN"},
      21 => %{index: 21, state: "Meghalaya", code: "ML"},
      22 => %{index: 22, state: "Mizoram", code: "MZ"},
      23 => %{index: 23, state: "Nagaland", code: "NL"},
      24 => %{index: 24, state: "Orissa", code: "OR"},
      25 => %{index: 25, state: "Pondicherry", code: "PY"},
      26 => %{index: 26, state: "Punjab", code: "PN"},
      27 => %{index: 27, state: "Rajasthan", code: "RJ"},
      28 => %{index: 28, state: "Sikkim", code: "SK"},
      29 => %{index: 29, state: "TamilNadu", code: "TN"},
      30 => %{index: 30, state: "Tripura", code: "TR"},
      31 => %{index: 31, state: "Uttar_Pradesh", code: "UP"},
      32 => %{index: 32, state: "West_Bengal", code: "WB"}
    }
  end

  @spec index_range(integer) :: tuple()
  def index_range(n) do
    if n < 6 do
      low = n * 5 - 4
      high = n * 5
      {low, high}
    else
      index_range(n)
    end
  end

  @spec next_loop_value(String.t(), integer) :: integer()
  @doc """
  prepares next loop value which can specify which helps to display
  the current showing states.
  """
  def next_loop_value(user_entry, current_loop_value) do
    case user_entry do
      "p" -> current_loop_value - 1
      "n" -> current_loop_value + 1
    end
  end

  @spec states_promt({integer, integer}) :: String.t()
  @doc """
  prepares the displable state prompt
  """
  def states_promt({low, high} = index_range) do
    indexes = Enum.to_list(low..high)
    code = get_state_code()

    by_state =
      code
      |> Map.take(indexes)
      |> Map.values()
      |> Enum.map(fn x ->
        state = Map.get(x, :state)
        index = Map.get(x, :index)
        "#{index}-#{state}"
      end)
      |> Enum.join("\n")
  end

  @spec select_state(integer) :: integer
  def select_state(current_loop_value \\ 1) do
    prompt =
      current_loop_value
      |> index_range()
      |> states_promt()

    prompt = "Enter Number of the State. To Go Next pres N/n  Previous P/p \n #{prompt}"

    state = read_string(prompt)

    case state do
      user_entry when user_entry in ["p", "n", "P", "N"] ->
        user_entry = String.downcase(user_entry)
        next_loop = next_loop_value(user_entry, current_loop_value)
        select_state(next_loop)

      entry ->
        {state_index, _any} = Integer.parse(entry)
        get_state_code()[state_index]
    end
  end
end
