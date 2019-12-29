# Ghosts of Departed Proofs

[source](./gdp.pdf)

## Despair in Hackage (pitfalls in the common libraries)

> a pit of despair: they had a mental proof that a certain key
> must be present in the map, but possessed no mechanism for
> communicating that proof to the lookup function.

## Coerce (GHC feature)

> Suppose a library author creates a module that defines N as a
> newtype of T, but does not export the constructor. Then the library
> author can use coerce to freely cast between T and N, but users
> of that library only see N as an opaque type, and are not able
> to coerce it to T.

## Conjuring a name

> A different solution, in line with the GDP concept, is to introduce
> a newtype wrapper equipped with a phantom type parameter name.
> In code, we will write this wrapper as `a ~~ n`, to be read as
> `values of type a with name n`
> To ensure that there is no run-time penalty for using names, `a ~~ n`
> is implemented as a newtype around a, with a phantom type parameter n

MY NOTES:

phantom type: <https://wiki.haskell.org/Phantom_type>

A phantom type is a parametrised type whose parameters do not all appear on the right-hand side of its definition,

```haskell
λ> newtype TT a b = TT a
λ> newtype TT a b = TT a b

<interactive>:13:18: error:
    • The constructor of a newtype must have exactly one field
        but ‘TT’ has two
    • In the definition of data constructor ‘TT’
      In the newtype declaration for ‘TT’
```

## Named and the compute() function

> Instead of directly returning a value with a name attached, name
> says to the user “tell me what you wanted to do with that
> named value, and I’ll do it for you”. This slight-of-hand is
> responsible for the rank-2 signature of name. The user must
> hand name a `computation` that is entirely agnostic about the
> name that will be chosen

MY NOTES: see `test/DemoNamed.hs`

## Use a two-parameter typeclass to unify name-stripping

see Named.hs and DemoNamed.hs

see also, DemoPhantomTypes.hs, for a degenerated example where the
`name` parameter is hardcoded to be a function; recall the `tag-dispatching`
strategy in C++

## Case study: Sort-Merge library

NOTE: this library uses MissingH package (a large collection of
utility functions)
