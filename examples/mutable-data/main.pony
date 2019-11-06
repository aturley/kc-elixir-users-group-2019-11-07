class Counter
  var _v: U64

  new create() =>
    _v = 0

  fun ref inc() =>
    _v = _v + 1

  fun v(): U64 =>
    _v

actor Incrementor
  let _counter: Counter ref

  new create(counter: Counter iso) =>
    _counter = consume counter

  be inc() =>
    _counter.inc()

  be report(out: OutStream) =>
    out.print("counter = " + _counter.v().string())

actor Main
  new create(env: Env) =>
    // Create a mutable object ...
    let c: Counter iso = recover
      let c' = Counter
      c'.inc()
      c'.inc()
      c'
    end

    // ... and pass the mutable object to another actor.
    let inc = Incrementor(consume c)

    inc.inc()
    inc.inc()
    inc.report(env.out)
