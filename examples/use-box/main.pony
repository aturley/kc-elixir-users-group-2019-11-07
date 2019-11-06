actor Main
  new create(env: Env) =>
    let mutable_array: Array[I64] = [1; 2; 3; 17; -5; 3]
    let immutable_array: Array[I64] = [7; -9; 13; 4; -8]

    env.out.print(count_negatives(mutable_array).string())
    env.out.print(count_negatives(immutable_array).string())

  // `array` has a reference capability of `box`, so it can
  // be assigned from aliases that are `ref` *or* `val`. The
  // alias can only be read, and because there is no
  // guarantee that there aren't other readable or mutable
  // aliases it cannot be sent to another actor.
  fun count_negatives(array: Array[I64] box): USize =>
    var count: USize = 0

    for x in array.values() do
      if x < 0 then
        count = count + 1
      end
    end

    count
