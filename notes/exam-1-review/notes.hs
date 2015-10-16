data Pair a b = Pair a b
    deriving (Show)

first :: (Pair a b) -> a 
first (Pair x _) = x

second :: (Pair a b) -> b
second (Pair _ y) = y

apply :: (Pair (b -> b) b) -> b
apply (Pair x y) = x y

data Tree = Null | Node Integer Tree Tree
    deriving (Show)

sum' :: Tree -> Integer
sum' Null = 0
sum' (Node e left right) = e + sum' left + sum' right 

ltree :: Tree -> Tree
ltree (Node _ n _) = n
ltree Null = Null

rtree :: Tree -> Tree
rtree (Node _ _ n) = n
rtree Null = Null


filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs , p x]

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' _ [] = []
filter'' p (x:xs)
    | p x       = x:filter p xs
    | otherwise  = filter p xs

map' :: (a -> a) -> [a] -> [a]
map' p (x:xs) = (p x):map p xs

max' :: (Ord a) => [a] -> a
max' [x] = x
max' (x:xs)
    | x > maxtail = x
    | otherwise   = maxtail
    where maxtail = max' xs

max'' :: (Ord a) => [a] -> a
max'' [x] = x
max'' (x:xs) = max x (max'' xs)

max''' :: (Ord a) => [a] -> a
max''' [] = error "You done fucked up"
max''' [x] = x
max''' (x:xs) = max_iter''' xs x
    where max_iter''' [] m = m
          max_iter''' (x:xs) m = max_iter''' xs (if x > m then x else m)

