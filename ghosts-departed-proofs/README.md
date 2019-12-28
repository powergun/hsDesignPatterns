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
