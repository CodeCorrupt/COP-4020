max' a b = if a >= b then a else b 

max3 (f, s, t) = (max' (max' f s) t)
