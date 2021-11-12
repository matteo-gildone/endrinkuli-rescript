let getRandomIntInclusive = (sides: int): int => {
  let min = 1->Js.Int.toFloat
  let max = sides->Js.Int.toFloat
  (Js.Math.random() *. (max -. min +. 1.0) +. min)->Js.Math.floor
}

let discardMin = (rolled: array<int>): array<int> => {
  let smallest = rolled->Js.Math.minMany_int
  let smallestIndex = Js.Array2.indexOf(rolled, smallest)
  let firstPart = rolled->Js.Array2.slice(~start=0, ~end_=smallestIndex)
  let secondPart = rolled->Js.Array2.slice(~start=smallestIndex + 1, ~end_=rolled->Js.Array2.length)
  Js.Array2.concat(firstPart, secondPart)
}

let getValueFromRegexResult = (result, index) => {
  switch result {
  | None => None
  | Some(r) =>
    Js.Re.captures(r)[index]
    ->Js.Nullable.toOption
    ->Belt.Option.getWithDefault("0")
    ->Belt.Int.fromString
  }
}