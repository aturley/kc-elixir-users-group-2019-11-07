class Embellisher
  var _str: String iso
  let _head: String
  let _tail: String

  new create(head: String, tail: String) =>
    _str = recover String end
    _head = head
    _tail = tail

  fun ref embellish(plain: String): String val =>
    _str.append(_head)
    _str.append(plain)
    _str.append(_tail)

    // When the new `String` is assigned to `_str`,
    // the result of the expression is the old  object
    // that it pointed to. Since `_str` is `iso`, the
    // compiler knows that the object has no other
    // readable or mutable aliases, so it is safe
    // to return it as a `String val`. This is useful
    // because while local aliases can be `consume`d,
    // fields cannot.

    _str = recover String end

actor Main
  new create(env: Env) =>
    let embellisher = Embellisher("||--> ", " <--||")

    for a in env.args.values() do
      env.out.print(embellisher.embellish(a))
    end
