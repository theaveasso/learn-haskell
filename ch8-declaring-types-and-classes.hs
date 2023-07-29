module DeclaringTypesAndClasses where

-- Type Declarations
-- In Haskell, a new name for an existing type can be defined using a [type declaration]
type String = [Char]

-- Type declarions can be used to make other types easier to read
type Pos = (Int, Int)

origin :: Pos
origin = (0, 0)

left :: Pos -> Pos
left (x, y) = (x - 1, y)

-- type declarions can also have [parameters]
type Pair a = (a, a)

mult :: Pair Int -> Int
mult (m, n) = m * n

copy :: a -> Pair a
copy x = (x, x)

-- type declarions can be nested
type Pos = (Int, Int)
type Trans = Pos -> Pos

-- Data Declarations
-- A completely new type can be defined by specifying its values using a [data declaration]
data Bool = False | True

-- The two values False and True are called the [construtors]
-- Type and constructor names must always begin with an upper-case letter
-- Data declarations are similar to context free grammars. The former specifies the values of  a typ. the latter the sentences of a language
data Answer = Yes | No | Unknown

answers :: [Answer]
answers = [Yes, No, Unknown]

switch :: Answer -> Answer
switch Yes     = No
switch No      = Yes
switch Unknown = Unknown


