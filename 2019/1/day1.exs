defmodule FuelConverter do
  def total_fuel_required(masses) do
    masses
      |> Enum.map(fn x -> FuelConverter.fuel_required(x) end)
      |> Enum.reduce(0, fn(x, acc) -> x + acc end)
  end

  def fuel_required(mass) do
    fuel_needed = Integer.floor_div(mass, 3) - 2
    if fuel_needed <= 0 do
      0
    else
      fuel_needed + FuelConverter.fuel_required(fuel_needed)
    end
  end
end

test_case_1 = [1969]
test_case_1_expected = 966
test_case_2 = [100756]
test_case_2_expected = 50346

module_masses = String.split(File.read!("./input.txt"), "\n")
  |> Enum.map(fn x -> Integer.parse(x) end)
  |> Enum.filter(fn x -> x != :error end)
  |> Enum.map(fn x -> elem(x, 0) end)

part2_result = FuelConverter.total_fuel_required(module_masses)
test_case_1_actual = FuelConverter.total_fuel_required(test_case_1)
test_case_2_actual = FuelConverter.total_fuel_required(test_case_2)

IO.puts("Test case 1: Expected: #{test_case_1_expected} Actual: #{test_case_1_actual} PASS: #{test_case_1_actual == test_case_1_expected}")
IO.puts("Test case 2: Expected: #{test_case_2_expected} Actual: #{test_case_2_actual} PASS: #{test_case_2_actual == test_case_2_expected}")

IO.puts(part2_result)

