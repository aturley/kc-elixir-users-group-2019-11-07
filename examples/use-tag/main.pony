actor Speaker
  let _name: String

  new create(name: String) =>
    _name = name

  be speak(phrase: String, out: OutStream tag) =>
    // `out` is an alias that refers to an actor, you can
    // use it to send messages to the actor even though
    // you can't use it to read or modify the actor
    // directly.
    out.print(_name + " says : '" + phrase + "'")

actor Main
  new create(env: Env) =>
    let cow = Speaker("cow")

    cow.speak("Why not play life closer to the chest?", env.out)
