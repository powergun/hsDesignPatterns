module DemoPhatomTypes (demo) where

newtype TT a name = TT a deriving (Show, Eq)

-- calling it tag to highlight its similarity to C++'s tag-dispatching
-- strategy
tag :: [String] -> [String]
tag = map id

-- exposed lib function to produce the "tagged" value
produce :: Show a => a -> TT a tag
produce a = TT a

-- exposed lib function to consume/compute/process the "tagged" value
-- the same category of functions may also return primitive types for
-- the convenience of the lib users
consume :: Show a => TT a tag -> a
consume (TT a) = a

demo :: IO ()
demo = do
  print . consume . produce $ "there is a cow"
