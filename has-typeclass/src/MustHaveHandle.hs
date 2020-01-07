module MustHaveHandle (demo) where

import           RIO
import           System.IO (hPutStrLn, stderr, stdout)

-- the constraint is only that, a type must have a "handle" field,
-- and must know how to provide this "handle" to the caller
-- I have two types here that can fulfill this duty, along with a third
-- type, which is the native Handle type
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

-- this function is called in several code paths, where different
-- types are threaded via the reader's environment
process :: HasHandle env => String -> RIO env ()
process s =
  asks getHandle >>= (\h -> liftIO . (hPutStrLn h) . ("use 'idnoclip' in " ++) $ s)

-- this function is called in a specific code path, where a specific
-- compliant data type is threaded via the reader's environment
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
