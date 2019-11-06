actor Main
  new create(env: Env) =>
    try
      let first_arg = get_first_arg(env.args)?
      env.out.print("first arg is '" + first_arg + "'")
    else
      env.err.print("not enough args")
    end

  fun get_first_arg(args: Array[String] val): String ? =>
    args(1)?
