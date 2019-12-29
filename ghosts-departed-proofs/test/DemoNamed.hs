{-# LANGUAGE TypeOperators #-}

module DemoNamed (demo) where

import           Named

compute :: (Show a) => Named n a -> IO ()
compute x = do
  print x
  print $ the x

demo :: IO ()
demo = do
  name 12 compute
