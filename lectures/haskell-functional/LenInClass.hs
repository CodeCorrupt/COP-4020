len :: [t] -> Integer
len [] = 0
len (_:xs) = 1 + (len xs)
