# has-typeclass

inspired by RIO tutorial: <https://tech.fpcomplete.com/haskell/library/rio>
has-typeclass example

## Use Has-Typeclass to enforce (data) compliance

to enforce that some unknown type must be able provide some critical
information, define a custom typeclass, calling it `HasXXX` - XXX
being the critical information, then use the standard type constraint
to express this requirement on the function type signature

see src/MustHaveHandle.hs

## This is not a useless boilerplate

<https://tech.fpcomplete.com/haskell/library/rio>

> The gut reaction of many Haskellers may be to find some way to automate around this, with some Generics usage, or Template Haskell, or something else. I recommend against that for multiple reasons:
> The boilerplate here, amortized across a project, is really small
> This is the "safe" kind of boilerplate: the compiler will almost always prevent you from making a mistake
> The code above is obvious and easy to follow
> The code above compiles really quickly

## Now that I have a handle-getter, what about a handle-setter

<https://tech.fpcomplete.com/haskell/library/rio>

> The basic concept of lenses is to package together a getter and setter for a field in a data structure.
> What we need is a lens that lets us peek from our big environment type into a Handle.
