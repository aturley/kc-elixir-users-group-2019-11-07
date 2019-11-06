actor Main
  new create(env: Env) =>
    // We want to be able to eventually send this string
    // to be printed, but first we want to make some
    // modifications to it.
    let s: String trn = recover String end

    for a in env.args.values() do
      s.append(a)
      s.append(" ")
    end

    // We want to be able to pass `s` to `count_periods`,
    // which will create a new alias to the `String` object,
    // so `s` couldn't be `iso`.
    let count = count_periods(s)

    s.append(" <-- there are ")
    s.append(count.string())
    s.append(" periods")

    // Once `s` is consumed the compiler knows that there
    // are no other mutable references to object, so it is
    // safe to assign it to a `val` alias.
    let sv: String val = consume s

    env.out.print(sv)

  fun count_periods(str: String box): USize =>
    var count: USize = 0

    for c in str.values() do
      if c == '.' then
        count = count + 1
      end
    end

    count
