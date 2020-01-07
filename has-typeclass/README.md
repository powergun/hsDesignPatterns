# has-typeclass

inspired by RIO tutorial: <https://tech.fpcomplete.com/haskell/library/rio>
has-typeclass example

## Use Has-Typeclass to enforce (data) compliance

to enforce that some unknown type must be able provide some critical
information, define a custom typeclass, calling it `HasXXX` - XXX
being the critical information, then use the standard type constraint
to express this requirement on the function type signature

see src/MustHaveHandle.hs
