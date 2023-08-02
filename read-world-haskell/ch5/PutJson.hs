module PutJson (
    putJValue
    ) where

import Data.List (intercalate)
import SimpleJson

renderJValue :: JValue -> String
renderJValue JNull           = "null"
renderJValue (JString s)     = show s
renderJValue (JNumber n)     = show n
renderJValue (JBool   True)  = show "true"
renderJValue (JBool   False) = show "false"
renderJValue (JObject o )    = "{" ++ pairs o ++ "}"
  where pairs [] = ""
        pairs ps = intercalate ", " (map renderPair ps)
        renderPair (k, v)    = show k ++ ": " ++ renderJValue v
renderJValue (JArray  arr)   = "[" ++ values arr ++ "]"
  where values [] = ""
        values xs = intercalate ", " (map renderJValue xs)

putJValue :: JValue -> IO ()
putJValue v = putStrln (renderJValue v)
