let getRandomIntInclusive = (sides: int): int => {
  let min = 1->Js.Int.toFloat
  let max = sides->Js.Int.toFloat
  (Js.Math.random() *. (max -. min +. 1.0) +. min)->Js.Math.floor
  //Js.Math.random_int(1, sides + 1)
}

//const discardMin = (rolled: number[]) => {
//    const rolls = rolled.slice();
//    const smallest = Math.min.apply(null, rolls);
//    const smallestIndex = rolls.indexOf(smallest);
//    return rolls.slice(0, smallestIndex).concat(rolls.slice(smallestIndex + 1));
//};

let discardMin = (rolled: array<int>): array<int> => {
  let smallest = rolled->Js.Math.minMany_int
  let smallestIndex = Js.Array2.indexOf(rolled, smallest)
  let firstPart = rolled->Js.Array2.slice(~start=0, ~end_=smallestIndex)
  let secondPart = rolled->Js.Array2.slice(~start=smallestIndex + 1, ~end_=rolled->Js.Array2.length)
  Js.Array2.concat(firstPart, secondPart)
}

let r = %re(
  "/^(\d*)d(\d+|%)(([+\-/*bw])(\d+))?(([+\-/*])(\d+|(\d*)d(\d+|%)(([+\-/*bw])(\d+))?))*$/"
)

let roll = (~removeMin=false, ~pattern: string, ()): (array<int>, int) => {
  Js.log("HERE")
  let result = Js.Re.exec_(r, pattern)

  let dices = switch result {
  | None => None
  | Some(r) =>
    Js.Re.captures(r)[1]->Js.Nullable.toOption->Belt.Option.getWithDefault("0")->Belt.Int.fromString
  //Belt.Int.fromString(Belt.Option.getWithDefault(Js.Nullable.toOption(Js.Re.captures(r)[1]), "0"))
  // Js.Nullable.toOption(Js.Re.captures(r)[1])
  }

  let sides = switch result {
  | None => None
  | Some(r) =>
    Js.Re.captures(r)[2]->Js.Nullable.toOption->Belt.Option.getWithDefault("0")->Belt.Int.fromString
  //Belt.Int.fromString(Belt.Option.getWithDefault(Js.Nullable.toOption(Js.Re.captures(r)[2]), "0"))
  // Js.Nullable.toOption(Js.Re.captures(r)[2])
  }

  let rolled = switch dices {
  | Some(r) =>
    r->Belt.Array.makeBy(_ =>
      switch sides {
      | Some(r) => getRandomIntInclusive(r)
      | None => 0
      }
    )
  | None => [0]
  }

  Js.log(rolled)

  let finalRolled = if removeMin {
    discardMin(rolled)
  } else {
    rolled
  }

  let value = finalRolled->Belt.Array.reduce(0, (acc, value) => acc + value)

  Js.log(finalRolled)
  Js.log(value)
  (finalRolled, value)
}

Js.log(
  Js.Obj.keys({
    "str": roll(~pattern="3d6")(),
    "dex": roll(~pattern="4d6", ~removeMin=true)(),
    "con": roll(~pattern="3d6")(),
    "int": roll(~pattern="3d6")(),
    "wis": roll(~pattern="3d6")(),
    "cha": roll(~pattern="3d6")(),
  }),
)