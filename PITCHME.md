<!-- .slide: class="center" -->

## Pony Programming Language

KC Elixir Users Group, 2019-11-07

Andrew Turley

---

## Information For This Talk

https://github.com/aturley/kc-elixir-users-group-2019-11-07

---

## About Me

Pony core team member

Lead software engineer at Wallaroo Labs

Using Pony for four years

---

## What is Pony?

Pony is

* open source
* object oriented
* actor model-based
* capabilities secure
* high performance
* data-race-free!

---

## No Data Races (this is the important part)

Guaranteed a compile time

No locks

---

## Important Pony Concepts

* actors
* behaviors
* aliases
* reference capabilities

---

## Actors

Actors are the unit of concurrency

Everything in your program happens in the context of some actor

---

## Behaviors

Behaviors process messages

```
actor SomeActor
  be special_behavior() => // defining a behavior

actor Main
  new create(env: Env) =>
    let sa = SomeActor
    sa.special_behavior() // sending a message
```

---

## Aliases

Aliases are names that refer to objects

```
  let alias1 = Object // assigned to new object
  var alias2 = alias1 // assigned to same object as alias1
  alias2 = Object     // reassigned to a new object
```

---

## Reference Capabilities

Allow the compiler to reason about whether or not it is safe to share or pass an object to another actor

Control what can be done with the alias, and make guarantees about what can be done with other aliases to the same object

---

## Example

[`examples/important-concepts`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/important-concepts)

---

## Pony vs BEAM

There are some important differences between Pony and BEAM-based languages

---

## Errors

Functions must either handle errors or propagate them out to their callers, behaviors MUST handle all errors

[`examples/error-handling`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/error-handling)

---

## Receiving Messages

There is no selective receive, messages are processed by an actor in the order in causal order

---

## No Preemptive Multitasking

An actor completely processes one message at a time before moving on to the next message

The scheduler checks to see which actors have messages in their queues and then runs the behavior associated with that message on an available thread

---

## Sync vs Async

All communication between actors is async

Actors communicate by sending messages to each other, there is no mechanism for waiting for a response

---

## Mutable Data

Mutable data can be passed between actors, reference capabilities ensure that this is done safely

[`examples/mutable-data`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/mutable-data)

---

## Reference Capabilities

Allow the compiler to reason about whether or not it is safe to share or pass an object to another actor

Control what can be done with the alias, and make guarantees about what can be done with other aliases to the same object

---

## Reference Capabilities

Read Rule and Write Rule

* If an object can be written to then only one actor can have a readable alias to it
* If an object can be read by multiple actors then no actor can have a writable alias to it

---

## Reference Capabilities

Let the compiler reason about the safety of sharing an object by only
looking at the guarantees made by a given alias

There is no need to do global program analysis

---

## `ref`

short for: *reference*

readable and mutable

other aliases can be readable and mutable

[`examples/use-ref`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/use-ref)

---

## `val`

short for: *value*

readable

other aliases can only be readable

[`examples/use-val`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/use-val)

---

## Aside -- `recover`

`recover` creates a special block where an object can be created with a less restrictive ref cap and then it can be "lifted" to a more restrictive ref cap

[`examples/use-recover`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/use-recover)

---

## `tag`

short for: *tag*

not readable or mutable

can be used to send messages

no restrictions on other aliases

[`examples/use-tag`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/use-tag)

---

## `iso`

short for: *isolated*

readable and mutable

no other readable or mutable aliases can exist

[`examples/use-iso`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/use-iso)

---

## Aside -- `consume` and Destructive Read

`consume` and destructive read allow an object to be unlinked from an alias

[`examples/use-destructive-read`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/use-destructive-read)

---

## `box`

short for: *box*

readable

other readable and mutable aliases may exist

[`examples/use-box`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/use-box)

---

## `trn`

short for: *transitional*

readable, mutable

other readable aliases may exist, but no other mutable aliases may exist

[`examples/use-trn`](https://github.com/aturley/kc-elixir-users-group-2019-11-07/tree/master/examples/use-trn)

---

## Reference Capabilities

Reference capabilities allow Pony to flexibly guarantee data-race freedom without relying on strategies like copying data or making all data immutable

---

## Thank you!

Thanks!
