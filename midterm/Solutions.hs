import Prelude hiding (min, minimum)

-- probem 3
-- a)

min a b 
  | a < b = a
  | otherwise = b

-- b)

minimum []     = error "empty list"
minimum [x]    = x
minimum (x:xs) = min x (minimum xs)

-- c)

-- I am using minimum_tail so that there is no clash 
-- with minimum in b)

minimum_tail :: Ord a => [a] -> a
minimum_tail []     = error "empty list"
minimum_tail (x:xs) = minimum_iterator x xs 

minimum_iterator :: Ord a => a -> [a] -> a
minimum_iterator m []     = m
minimum_iterator m (x:xs) = minimum_iterator (min m x) xs

-- d)


-- I am using minimum_foldl so that there is no clash 
-- with minimum in b)

minimum_foldl :: Ord a => [a] -> a
minimum_foldl []     = error "empty list"
minimum_foldl (x:xs) = foldl min x xs