-- Get first
f :: a -> b -> a
f x y = x

-- Get second
s :: a -> b -> b
s x y = y

-- Custom flip implimentation
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = \x y -> f y x

-- Apply dot opperator to function
twice :: (a -> a) -> (a -> a)
twice f = f . f

-- An infix opperation to append single element to a list
infixr 5 <:<
(<:<) :: a -> [a] -> [a]
(<:<) x xs = xs++[x]

-- '>*>' == +
infixr 5 >*>
(>*>) :: Num a => a -> a -> a
(>*>) x y = x+y

-- 3-a
min' :: Ord a => a -> a -> a
min' a b 
        | a < b = a
        | a >= b = b
-- 3-b
minimum' :: Ord a => [a] -> a
minimum' (x:xs) = min x (minimum xs)

-- 3-c
minimum'' :: Ord a => [a] -> a
minimum'' (x:xs) = itmin x xs

itmin :: Ord a => a -> [a] -> a
itmin x [] = x
itmin x (y:ys) = itmin (min' x y) ys

minimum''' :: Ord a => [a] -> a
minimum''' (x:xs) = foldl min' x xs

-- Expression Parser
data Expr =  Lit Integer
           | Inc Expr
           | Dec Expr
           | Add Expr Expr
           | Sub Expr Expr

eval :: Expr -> Integer
eval (Lit x) = x
eval (Inc ex) = (eval ex) + 1
eval (Dec ex) = (eval ex) - 1

sumlist :: [Integer] -> Integer
sumlist xs = foldr (+) 0 xs

-- Tree Data stuctur
data Tree = Null | Node Integer Tree Tree
    deriving (Show)

preorder :: Tree -> [Integer]
preorder Null = []
preorder (Node x t1 t2) = [x] ++ (preorder t1) ++ (preorder t2)

sumtree :: Tree -> Integer
sumtree Null = 0
sumtree (Node x t1 t2) = x + (sumtree t1) + (sumtree t2)

sumtree' :: Tree -> Integer
sumtree' t = foldl (+) 0 (preorder t)


sumtree'' :: Tree -> Integer
sumtree'' t = (sumlist . preorder) t

-- Map function onto tree
tmap :: (Integer -> Integer) ->  Tree -> Tree
tmap f Null = Null
tmap f (Node x t1 t2) = Node (f x) (tmap f t1) (tmap f t2)

-- Reverse a tree
revtree :: Tree -> Tree
revtree Null = Null
revtree (Node x t1 t2) = Node x (revtree t2) (revtree t1)

--My implimentation of map
map' :: (a -> a) -> [a] -> [a]
map' f [] = []
map' f (x:xs) = (f x):(map' f xs)

-- Tail recursive implimentation
map'' :: (a -> a) -> [a] -> [a]
map'' f xs = maphelp f xs []

maphelp :: (a -> a) -> [a] -> [a] -> [a]
maphelp _ [] ys = ys
maphelp f (x:xs) ys = maphelp f xs (ys ++ [(f x)])


-- Mask a boolian array and an int array
mask :: [Bool] -> [a] -> [a]
mask [] _ = []
mask _ [] = []
mask (b:bs) (x:xs)
                   | b == True = x:(mask bs xs)
                   | b == False = mask bs xs

-- Fold using mask
fold' :: (a -> Bool) -> [a] -> [a]
fold' f xs = mask (map f xs) xs
