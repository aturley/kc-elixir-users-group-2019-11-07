actor Main
  new create(env: Env) =>
    // A `recover` block allows you to create a less
    // restrictive alias and then turn it into an object
    // with a more restrictive alias. Normally we wouldn't
    // be able to assign an object aliased by a `ref` to a
    // `val`, but because the ref is created inside a
    // recover block it is possible to do this

    let combined_args: String = recover
      let args: String ref = String

      for a in env.args.values() do
        args.append(a)
      end

      // A recover block is an expression whose value is
      // the last expression inside the block.
      args
    end

    // `env.out.print(...)` takes a `String val` argument
    // because `out` is an actor and `print(...)` is a
    // message, so there cannot be other mutable aliases to
    // the argument.
    env.out.print(combined_args)
