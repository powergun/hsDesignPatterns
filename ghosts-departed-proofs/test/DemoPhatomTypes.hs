module DemoPhatomTypes (demo) where

newtype TT a name = TT a deriving (Show, Eq)

tag :: [String] -> [String]
tag = id

produce :: Show a => a -> TT a tag
produce a = TT a

consume :: Show a => TT a tag -> a
consume (TT a) = a

demo :: IO ()
demo = do
  print . consume . produce $ "there is a cow"
