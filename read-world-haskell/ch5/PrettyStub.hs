module PrettyStub where

import SimpleJson

data Doc = ToBeDefined
  deriving (Show)

string :: String -> Doc
string str = enclose '"' '"' . hcat . map oneChar

hcat :: [Doc] -> Doc
hcat xs = undefined

(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc
char c = undefined

oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscape of
              Just r -> text r
              Nothing | mustEscape c -> hexEscape c
                      | otherwise    -> char c
            where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'

simpleEscape :: [(Char, String)]
simpleEscape = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
  where ch a b = (a, ['\\', b])

text :: String -> Doc
text str = undefined

double :: Double -> Doc
double num = undefined

