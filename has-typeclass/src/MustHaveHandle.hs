module MustHaveHandle (demo) where

import           RIO
import           System.IO (hPutStrLn, stderr, stdout)

-- the restriction is only that, a type must have a "handle" field,
-- and must know how to provide this "handle" to the caller
data SimpleConf = SimpleConf { simpleHandle :: Handle }
data AppConf = AppConf { appHandle :: Handle, appName :: String }

class HasHandle env where
  getHandle :: env -> Handle
instance HasHandle Handle where -- consider the actual Handle type a fit too!
  getHandle = id
instance HasHandle SimpleConf where
  getHandle = simpleHandle
instance HasHandle AppConf where
  getHandle = appHandle

-- support a wide range of types
process :: HasHandle env => String -> RIO env ()
process s =
  asks getHandle >>= (\h -> liftIO . (hPutStrLn h) . ("use 'idnoclip' in " ++) $ s)

-- support only specific type(s)
compute :: RIO AppConf ()
compute =
  asks appName >>= process

demo :: IO ()
demo = do
  -- use the native Handle type
  runRIO stdout (process "e1m1")

  -- use the simple conf type which is compliant
  runRIO (SimpleConf stdout) (process "e2m2")

  -- use the app conf type
  runRIO (AppConf stderr "e3m9 - tower of babel") compute
