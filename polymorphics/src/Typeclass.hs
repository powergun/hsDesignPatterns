module Typeclass (demo) where

-- Library code
class Renderable a where
    color :: a -> (Int, Int, Int)

render :: (Renderable a) => a -> String
render i =
    let (x, y, z) = color i
    in "[" ++ show (x + y + z) ++ "]"

data Matt = BlackHole | Matt Int

instance Renderable Matt where
    color BlackHole = (0, 0, 0)
    color (Matt x)  = (x, x, x)

-- Client code
data Lambert = Glossy Int Int

instance Renderable Lambert where
    color (Glossy c albedo) = (c * albedo - 255, c, c + 255)

-- Client program
demo :: IO ()
demo = do
    let bo = BlackHole
        mt = Matt 133
        lm = Glossy 56 23
    print . render $ bo
    print . render $ mt
    print . render $ lm

