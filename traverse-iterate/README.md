# Iterator Pattern via Traversable

inspired by: haskell design pattern P/149

> The Foldable instance and Traversable lift Prelude `fold` and `map`
> to a much higher level of abstraction.
> Moreover, `Foldable` and `Traversable` also bring a clean separation
> between processes that preserve or discard the shape of the structure
> being processed

Traversable: This describes a process that preserves that shape of the
data structure being traversed over

Foldable: This process, in turn, discards or transforms the shape of
the structure being folded over
