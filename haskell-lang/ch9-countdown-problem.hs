module CountdownProblem where

-- Solve count down problem
data Opt = Add' | Sub' | Mul' | Div'

apply :: Opt -> Int -> Int -> Int
apply Add' x y = x + y
apply Sub' x y = x - y
apply Mul' x y = x * y
apply Div' x y = x `div` y

-- Decide if the result of applying operator to two positive natural numbers is another such
valid :: Opt -> Int -> Int -> Bool
valid Add' _ _ = True
valid Sub' x y = x > y
valid Mul' _ _ = True
valid Div' x y = x `mod` y == 0

data Expr = Val Int | App Opt Expr Expr

eval :: Expr -> [Int]
eval (Val n)     = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l
                                , y <- eval r
                                , valid o x y]

choices :: Num Int => [a] -> [[a]]
choices [] = [[]]
choices(x:xs) = let xsChoices = choices xs 
                in xsChoices ++ map (x:) xsChoices

values :: Expr -> [Int]
values (Val n)     = [n]

-- solution :: Expr -> [Int] -> Bool
-- solution e ns n = elem (values e) (choices ns)
--                   && eval e == [n]

split :: [a] -> [([a], [a])]
split [x]    = []
split (x:xs) = ([x], xs) : [(x:ys, zs) | (ys, zs) <- split xs]

combine :: Expr -> Expr -> [Expr]
combine l r =
  [App o l r | o <- [Add', Sub', Mul', Div']]

exprs :: [Int] -> [Expr]
exprs []  = []
exprs [n] = [Val n]
exprs ns  = [e | (ls,rs) <- split ns
               , l       <- exprs ls
               , r       <- exprs rs
               , e       <- combine l r]

solutions :: [Int] -> Int -> [Expr]
solutions ns n = [e | ns' <- choices ns
                    , e   <- exprs ns'
                    , eval e == [n]]
