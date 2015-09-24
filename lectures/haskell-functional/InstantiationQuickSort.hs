--makeSort :: (Ord a) => (a -> a -> Bool) -> [a] -> [a]
makeSort comp = qsort comp

--qsort :: (Ord a) => (a -> a -> Bool) -> [a] -> [a]
qsort _ [] = []
qsort _ (x:xs) = x:xs
--qsort comp (x:xs) = (qsort comp less) ++ [x] ++ (qsort comp greater)
--  where less    = [y | y <- xs, y `comp` x]
--        greater = [y | y <- xs, not (y `comp` x)]






add a b = a + b

makeAdd = add 3
makeAdd2 x = add x