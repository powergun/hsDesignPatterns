{-# LANGUAGE DefaultSignatures      #-}
{-# LANGUAGE ExplicitNamespaces     #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE RankNTypes             #-}
{-# LANGUAGE TypeOperators          #-}
{-# LANGUAGE TypeSynonymInstances   #-}

module Named (Named, type (~~), name, The(..)) where

import           Data.Coerce

newtype Named name a = Named a deriving (Show, Eq)
type a ~~ name = Named name a

-- Morally, the type of `name` is
-- a -> (exists name. (a ~~ name))
name :: a -> (forall name. (a ~~ name) -> t) -> t
name x k = k (coerce x)

class The d a | d -> a where
  the :: d -> a
  default the :: Coercible d a => d -> a
  the = coerce

instance The (a ~~ name) a
