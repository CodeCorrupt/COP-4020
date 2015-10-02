data Prod a b = a :* b

instance (Eq a, Eq b) => Eq (Prod a b) where
  (x :* y) == (x' :* y') =
    (x == x' && y == y')

instance (Show a, Show b) => Show (Prod a b) where
  show (x :* y) = (show x) ++ " x " ++ (show y)