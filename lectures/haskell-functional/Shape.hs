data Shape = Circle Float |
             Rectangle Float Float
               deriving (Eq, Show) 

area :: Shape -> Float
area (Circle r)      = pi * r * r
area (Rectangle h w) = h * w