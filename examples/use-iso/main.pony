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
    // `counter` is `iso`, so it can be consumed and the
    // object can be assinged to another alias with any
    // reference capability.
    _counter = consume counter

  be inc() =>
    _counter.inc()

  be report(out: OutStream) =>
    out.print("counter = " + _counter.v().string())

actor Main
  new create(env: Env) =>
    // `c` is an `iso` alias, so it is guaranteed to be the
    // only alias that can read or modify the object that it
    // refers to.
    let c: Counter iso = recover
      let c': Counter ref = Counter
      c'.inc()
      c'.inc()
      c'
    end

    // When `c` is consumed the compiler knows that there
    // are no other readable or mutatable references to the
    // object that it refered to, so it is safe to send the
    // object to another actor.
    let inc = Incrementor(consume c)

    inc.inc()
    inc.inc()
    inc.report(env.out)
