module Sort where

qsort [] = []
qsort (x: xs) = qsort lowerBound ++ [x] ++ qsort upperBound
               where 
                lowerBound = [a | a <- xs, a <= x]
                upperBound = [b | b <- xs, b > x]

n = a `div` length xs 
                  where 
                    a = 10
                    xs = [1,2,3,4,5]

dropHead xs = drop (length xs - 1) xs
takeLast xs = xs !! (length xs - 1)
takeRevHead xs = head (reverse xs)

newInit xs = reverse(tail(reverse xs))
takeInit xs = take (length xs - 1) xs
