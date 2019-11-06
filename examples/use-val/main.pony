actor Greeter
  let _greeting: String val

  new create(greeting: String val) =>
    _greeting = greeting

  be speak(thing: String val, out: OutStream) =>
    out.print(_greeting + ", " + thing)

actor Main
  new create(env: Env) =>
    let s1: Greeter = Greeter("Hello")
    let s2: Greeter = Greeter("Howdy")

    let thing: String val = "world"

    // `s1` and `s2` have aliases that point to the "world"
    // string object. They can safely share the object
    // because `val` guarantees that there are no writable
    // aliases.
    s1.speak(thing, env.out)
    s2.speak(thing, env.out)
