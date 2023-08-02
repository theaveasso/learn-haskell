module FuntionalProgramming where

-- simple cmd framework
import System.Environment (getArgs)

splitLines :: String -> [String]
splitLines [] = []
splitLines xs =
    let (pre, suf) = break isLineTerminator xs
     in pre : case suf of
            ('\r' : '\n' : rest) -> splitLines rest
            ('\r' : rest) -> splitLines rest
            ('\n' : rest) -> splitLines rest
            _ -> []

isLineTerminator :: Char -> Bool
isLineTerminator c = c == '\r' || c == '\n'

fixLines :: String -> String
fixLines i = unlines (splitLines i)

-- Basic list manipulation
-- length [1,2,3] -> 3
-- null   []      -> True
-- null   [1,2,3] -> False
-- head   [1,2,3] -> 1
-- tail   [1,2,3] -> [2,3]
-- init   [1,2,3] -> [1,2]
-- last   [1,2,3] -> [3]
-- head   []      -> '*** Exception: Prelude.head: empty list'

-- safe definition
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x : _) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (_ : xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast xs = safeHead $ reverse xs

safeInit :: [a] -> Maybe a
safeInit [] = Nothing
safeInit xs = Just (init xs)
