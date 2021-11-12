type dice_roll = {rolls: array<int>, value: int}

let generateRolls = (dices: int, sides: int): array<int> => {
  let result = dices->Belt.Array.makeBy(_ => Utils.getRandomIntInclusive(sides))
  result
}

let r = %re(
  "/^(\d*)d(\d+|%)(([+\-/*bw])(\d+))?(([+\-/*])(\d+|(\d*)d(\d+|%)(([+\-/*bw])(\d+))?))*$/"
)

let roll = (~removeMin=false, ~pattern: string, ()): dice_roll => {
  let result = Js.Re.exec_(r, pattern)
  let dices = Utils.getValueFromRegexResult(result, 1)
  let sides = Utils.getValueFromRegexResult(result, 2)
  let rolled = generateRolls(
    Belt.Option.getWithDefault(dices, 0),
    Belt.Option.getWithDefault(sides, 0),
  )

  let finalRolled = if removeMin {
    Utils.discardMin(rolled)
  } else {
    rolled
  }

  let value = finalRolled->Belt.Array.reduce(0, (acc, value) => acc + value)

  {rolls: finalRolled, value: value}
}