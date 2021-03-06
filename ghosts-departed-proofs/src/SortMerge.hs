{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeOperators         #-}

module SortMerge where

import           Data.Coerce
import qualified Data.List       as L
import qualified Data.List.Utils as U
import           Named

newtype SortedBy comp a = SortedBy a

instance The (SortedBy comp a) a

sortBy :: ((a -> a -> Ordering) ~~ comp)
          -> [a]
          -> SortedBy comp [a]
sortBy comp xs = coerce (L.sortBy (the comp) xs)

mergeBy :: ((a -> a -> Ordering) ~~ comp)
           -> SortedBy comp [a]
           -> SortedBy comp [a]
           -> SortedBy comp [a]
mergeBy comp xs ys = coerce (U.mergeBy (the comp) (the xs) (the ys))
