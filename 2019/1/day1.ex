module_masses = String.split(File.read!("./input.txt"), "\n")
  |> Enum.map(fn x -> Integer.parse(x) end)
  |> Enum.filter(fn x -> x != :error end)
  |> Enum.map(fn x -> elem(x, 0) end)

part1_result = module_masses
  |> Enum.map(fn x -> Integer.floor_div(x, 3) - 2 end)
  |> Enum.reduce(0, fn(x, acc) -> x + acc end)

IO.puts(part1_result)

