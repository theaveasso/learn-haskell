module DefiningFunction where

-- Conditional Expression
-- functions can be defined using 'conditional expression'

absFunc :: Int -> Int
absFunc n = if n >= 0 then n else -n

signumFunc :: Int -> Int
signumFunc n =
    if n < 0
        then -1
        else
            if n == 0
                then 0
                else 1

-- Guarded Equations
-- As an alternative to conditionals, functions can also be defined using [guarded equations]
absGFunc n
    | n >= 0 = n
    | otherwise = -n

signumGFunc n
    | n < 0 = -1
    | n == 0 = 0
    | otherwise = 1

-- Pattern Matching
-- Many functions have a particularly clear definition using [pattern matching] on their arguments
notPM :: Bool -> Bool
notPM False = True
notPM True = False

-- List Pattern
-- Internally, every non-empty list is constructed by repeated use of an operator (:) called [cons] that adds an element to the start of a list

-- Lambda Expression
-- Functions can be constructed without naming the functions by [lambda expressions]
-- Can be used to avoid naming functions that are only [referenced once]
oddFunc :: (Integral a) => a -> [a]
oddFunc n = map f [0 .. n - 1]
  where
    f x = x * 2 + 1

-- Operator Sections
-- An operator written [between] its two arguments can be converted into a curried function written [before] its two arguments by using parentheses
incOneFunc :: (Num a) => [a] -> [a]
incOneFunc xs = map (1 +) xs

-- Exercises
safeTail' :: [a] -> [a]
safeTail' [] = []
safeTail' (_ : xs) = xs

-- safeTail'' :: [a] -> [a]
-- safeTail'' (_: xs) = if not (null xs) then xs else []

safeTail''' :: [a] -> [a]
safeTail''' (_ : xs)
    | null xs = []
    | otherwise = xs

or' :: Bool -> Bool -> Bool
or' False False = False
or' _ _ = True

and' :: Bool -> Bool -> Bool
and' True b = b
and' False _ = False

and'' :: Bool -> Bool -> Bool
and'' a b = if a then b else False
