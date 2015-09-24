max' :: Ord a => [a] -> a
max' [] = error "Empty list"
max' xs = foldr1 max xs   

minNN 0 _ = 0
minNN _ 0 = 0
minNN x y = if x <= y then x else y

minNNList xs = foldr1 minNN xs

minNNListL xs = foldl1 minNN xs
 