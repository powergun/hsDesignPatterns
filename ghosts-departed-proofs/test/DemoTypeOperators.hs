{-# LANGUAGE TypeOperators #-}

module DemoTypeOperators (demo) where

import           Data.Coerce

newtype Named name a = Named a
type a ~~ name = Named name a

-- see below: any type can be tagged with a given name, even if
-- the types mean difference things!
any_name :: a -> (a ~~ name)
any_name = coerce

-- define a "tag" type that can not be constructed as value
data GoodType

demo :: IO ()
demo = do
  let r :: ([String] -> [String]) ~~ GoodType
      r = any_name id
  return ()
