module HigherOrder where

-- A function is called [higher-order] if it takes a function as an argument or returns a function as a result
-- twice :: (a -> a) -> a -> a
-- twice f x = f (f x)

-- Why are they useful?
-- [Common programming idios] can be encoded as functions within the language itself
-- [Domain specific languages] can be defined as collections of higher-order functions
-- [Algebraic properties] of higher-order functions can be used to reason about programs.

-- The map function
-- The ho library function called [map] applies a function to every element of a list
map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]
-- recursive
-- rMap [] = []
-- rMap f (x:xs) = f x : rMap f xs 

filter' :: (a -> Bool) -> [a] -> [b]
filter' f xs = [x | x <- xs, f x]
-- recursive
-- rFilter [] = []
-- rFilter f (x:xs) = | f x       = x : rFilter f xs
--                    | otherwise = rFilter f xs



