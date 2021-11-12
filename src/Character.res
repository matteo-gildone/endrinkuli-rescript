let create = () =>
  {
    "str": Roll.roll(~pattern="4d6", ~removeMin=true)().value,
    "dex": Roll.roll(~pattern="4d6", ~removeMin=true)().value,
    "con": Roll.roll(~pattern="4d6", ~removeMin=true)().value,
    "int": Roll.roll(~pattern="4d6", ~removeMin=true)().value,
    "wis": Roll.roll(~pattern="4d6", ~removeMin=true)().value,
    "cha": Roll.roll(~pattern="4d6", ~removeMin=true)().value,
  }

let getModifier = (score: int): int => {
  switch score {
  | 3 => -3
  | 4 | 5 => -2
  | 6 | 7 | 8 => -1
  | 9 | 10 | 11 | 12 => 0
  | 13 | 14 | 15 => 1
  | 16 | 17 => 2
  | 18 => 3
  | _ => 0
  }
}