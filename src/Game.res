let character = Character.create()
Js.log("-----------------------------------")
Js.log(
  `${character["str"]->Js.Int.toString} (${Character.getModifier(
      character["str"],
    )->Js.Int.toString})`,
)
Js.log(
  `${character["dex"]->Js.Int.toString} (${Character.getModifier(
      character["dex"],
    )->Js.Int.toString})`,
)
Js.log(
  `${character["con"]->Js.Int.toString} (${Character.getModifier(
      character["con"],
    )->Js.Int.toString})`,
)
Js.log(
  `${character["int"]->Js.Int.toString} (${Character.getModifier(
      character["int"],
    )->Js.Int.toString})`,
)
Js.log(
  `${character["wis"]->Js.Int.toString} (${Character.getModifier(
      character["wis"],
    )->Js.Int.toString})`,
)
Js.log(
  `${character["cha"]->Js.Int.toString} (${Character.getModifier(
      character["cha"],
    )->Js.Int.toString})`,
)
Js.log("-----------------------------------")