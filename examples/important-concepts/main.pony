actor Speaker
  let _name: String val

  new create(name: String val) =>
    _name = name

  // This is a behavior called `speak`. It means that `Speaker`
  // actors can receive a message called `speak`.
  be speak(out: OutStream tag) =>
    out.print("My name is" + _name)


actor Main
  new create(env: Env val) =>
    // This creates an alias `s` to a new `Speaker` actor.
    let s: Speaker tag = Speaker("Andy")

    // This sends a `speak` message to the `Speaker` actor
    // aliased by `s`. The actor processes the message
    // asynchronously.
    s.speak(env.out)
