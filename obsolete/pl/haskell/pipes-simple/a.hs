import Control.Proxy
--import Control.Proxy.Core         -- Everything except the base implementation
--import Control.Proxy.Core.Correct -- The alternative base implementation

import System.IO(Handle, IOMode(ReadMode), withFile, hGetLine, hIsEOF)

--                   Consumes 'a's ---+----------+    +-- Never terminates, so
--                                    |          |    |   the return value is
--                                    v          v    v   polymorphic
printer :: (Proxy p, Show a) => () -> Consumer p a IO r
printer () = runIdentityP $ forever $ do
  a <- request ()  -- Consume a value
  lift $ putStrLn "Received a value:"
  lift $ print a

--                 Produces Strings ---+----------+
--                                     |          |
--                                     v          v
lines' :: (Proxy p) => Handle -> () -> Producer p String IO ()
lines' h () = runIdentityP loop where
  loop = do
    eof <- lift $ hIsEOF h
    if eof
      then return ()
      else do
        str <- lift $ hGetLine h
        respond str  -- Produce the string
        loop

--                  Self-contained session ---+         +--+-- These must match
--                                            |         |  |   each component
--                                            v         v  v
--
--lines' h  >-> printer :: (Proxy p) => () -> Session p IO ()

main :: IO ()
main = withFile "test.txt" ReadMode $ \h -> runProxy $ lines' h >-> printer
-- getLine >>= putStrLn


