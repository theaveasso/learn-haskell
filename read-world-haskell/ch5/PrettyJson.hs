module PrettyJson where

import SimpleJson 
import PrettyStub

renderJValue :: JValue -> Doc
renderJValue JNull = text "null"
renderJValue (JString s)     = string s
renderJValue (JNumber n)     = double n
renderJValue (JBool   True)  = text "true"
renderJValue (JBool   False) = text "false"

-- appends two Doc values, so it's the Doc equivalent of (++) 
enclose :: Char -> Char -> Doc -> Doc
enclose l r x = char l <> x <> char r

-- escapes or renders an individual character
-- oneChar :: Char -> Doc oneChar c = case lookup c simpleEscape of
--               Just r -> text r
--               Nothing | mustEscape c -> hexEscape c
--                       | otherwise    -> char c
--             where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'

simpleEscape :: [(Char, String)]
simpleEscape = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
  where ch a b = (a, ['\\', b])

