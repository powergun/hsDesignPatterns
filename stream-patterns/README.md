# Streams

## Stream: the promise of potential infinity

inspired by: haskell design patterns P/68

```haskell
-- infinite stream and monadic consumer
foldM (\acc elem -> bool (Left acc) (Right (acc + elem)) (acc < 100)) 0 [1..]
--                       ^^^^^^^^^^  ^^^^^               ^^^^^^^^^^^ effect
--                                         ^^^^^^^^^^^^ computation
```

see also: P/140, folding with monadic functions

## To model changes: Immutablility

haskell design pattern P/68
