import Prelude hiding ((++), map)

myfilter :: (a -> Bool) -> [a] -> [a]
myfilter p ls = [ e | e <- ls, p e]

addPairs xs = [ x + y | (x, y) <- xs]

(x:xs) ++ ys = x : (xs ++ ys)
[] ++ ys = ys

map f [] = []
map f (x:xs) = f x : map f xs

unzip :: [(a,b)] -> ([a], [b])
unzip [] = ([], [])
unzip xs = (left xs, right xs)
      where left [] = []
            left ((a,_):xs) = a : left xs
            right [] = []
            right ((_,b):xs) = b : right xs
