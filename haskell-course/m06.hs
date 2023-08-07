module M06 where

-- recursion
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ v [] = v
foldr' f v (x : xs) = f x (foldr f v xs)

and' :: [Bool] -> Bool
and' = foldr (&&) True

sum' :: (Num a) => [a] -> a
sum' = foldr (+) 0

length' :: [a] -> Int
length' = foldr (\_ n -> 1 + n) 0

product' :: (Num a) => [a] -> a
product' = foldr (\x n -> x * n) 1

reverse' :: [a] -> [a]
reverse' = foldr (\x xs -> xs ++ [x]) []

drop' :: Int -> [a] -> [a]
drop' _ [] = []
drop' n xs | n <= 0 = xs
drop' n (_ : xs) = drop' (n - 1) xs

take' :: Int -> [a] -> [a]
take' n _ | n <= 0 = []
take' _ [] = []
take' n (x : xs) = x : take' (n - 1) xs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x : xs)
    | f x = x : filter' f xs
    | otherwise = filter' f xs
