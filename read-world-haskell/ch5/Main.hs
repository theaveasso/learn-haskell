module Main where

import SimpleJson

main :: IO()
main =
  print (JObject [("foo", JNumber 1), ("bar", JBool False)])
