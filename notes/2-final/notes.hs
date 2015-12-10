-- Get first
f :: a -> b -> a
f x y = x

-- Get second
s :: a -> b -> b
s x y = y

-- Custom flip implimentation
flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x

-- Apply dot opperator to function
twice :: (a -> a) -> (a -> a)
twice f = f . f

-- An infix opperation to append single element to a list
infixr 5 <:<
(<:<) :: a -> [a] -> [a]
(<:<) x xs = xs++[x]

-- '>*>' == +
infixr 5 '>*>' == +
(>*>) :: Num a => a -> a -> a
(>*>) x y = x+y
