{-# LANGUAGE TypeOperators #-}

module DemoPhantomTypesRestricted (demo) where

import           Data.Coerce
import           Named

newtype Product tag a = Product a

tag :: [a] -> [a]
tag = map id

notTag :: [a] -> [a]
notTag = id

produce :: (Show a)
           => (([String] -> [String]) ~~ tag)
           -> [a]
           -> Product tag [a]
produce tag xs = Product xs

consume :: (Show a)
           => (([String] -> [String]) ~~ tag)
           -> Product tag [a]
           -> [a]
consume tag (Product xs) = xs

demo :: IO ()
demo = do
  name tag $ \tag ->
    name notTag $ \notTag ->
      let p1 = produce tag [1, 2]
          p2 = produce notTag [3, 4]
      in print $ consume tag p1 -- consume tag p2 won't compile!!
