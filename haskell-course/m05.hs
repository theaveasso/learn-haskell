module M05 where

-- Higher order functions
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

complexFunc1 :: Int -> Int
complexFunc1 x = x * x

func1 :: Int -> Int
func1 x = applyTwice complexFunc1 x

-- filter
filterOdd :: (Integral a) => [a] -> [a]
filterOdd xs = filter odd xs

nameWithA :: [String] -> [String]
nameWithA xs = filter isContain xs
  where
    isContain name = 'a' `elem` name

-- any
largerThan :: (Ord a) => a -> a -> Bool
largerThan x y = x < y

anyLargerThan :: (Ord a, Integral a) => [a] -> a -> Bool
anyLargerThan xs x = any (largerThan x) xs

-- lambda function
-- \x y -> x + y

nameWithA' :: [String] -> [String]
nameWithA' xs = filter (\x -> 'a' `elem` x) xs

-- Precedence
-- Associativity (left -> right) || (right -> left)

-- Curried functions
add3 :: Int -> (Int -> (Int -> Int))
add3 x y = \z -> x + y + z

-- add3 :: Int -> (Int -> (Int -> Int))
-- add3 x = \y -> (\z -> x + y + z)
--
-- add3 :: Int -> (Int -> (Int -> Int))
-- add3 = \x -> (\y -> (\z -> x + y + z))

-- Partial application
createEmail :: String -> String -> String -> String
createEmail domain name lastname = concat [name, ".", lastname, "@", domain]

createEmailTeckel :: String -> String -> String
createEmailTeckel = createEmail "teckel-owners.com"

createEmailSCL :: String -> String -> String
createEmailSCL = createEmail "secret-cardano-lovers.com"

-- Apply composing
-- The function application $ operator
complicateF :: [Int] -> Bool
complicateF xs = any even (filter (> 25) (tail (take 10 xs)))
