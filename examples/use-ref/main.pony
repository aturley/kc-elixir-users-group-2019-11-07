actor Main
  new create(env: Env) =>
    let upper_args: Array[String] ref = Array[String]

    up(env.args, upper_args)

    for a in upper_args.values() do
      env.out.print(a)
    end

  fun up(args: Array[String] val, u_args: Array[String] ref) =>
    // There are two r/w aliases to the mutable array:
    //   * `u_args`
    //   * the alias that was used at the call site
    for a in args.values() do
      u_args.push(a.upper())
    end
