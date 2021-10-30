# Endrinkuli ReScript Project

### Tweaks
```rescript
// From this
let dices = switch result {
| Some(r) => Js.Nullable.toOption(Js.Re.captures(r)[1])
| None => None
}

let dicesToInt = switch dices {
| Some(r) => Belt.Int.fromString(r)
| None => None
}

// To this
let dices = switch result {
| None => None
| Some(r) => Belt.Int.fromString(Belt.Option.getWithDefault(Js.Nullable.toOption(Js.Re.captures(r)[1]), "0"))
}

// To Pipe
let dices = switch result {
| None => None
| Some(r) => Js.Re.captures(r)[1]->Js.Nullable.toOption->Belt.Option.getWithDefault("0")->Belt.Int.fromString
}
```
