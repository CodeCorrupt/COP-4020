module ExpValueEval where 

data Exp = BoolLit Bool 
           | IntLit Integer
           | Sub Exp Exp
           | Equal Exp Exp
           | If Exp Exp Exp
           deriving (Show, Eq)


data Value = BV Bool | IV Integer | Wrong
               deriving (Show, Eq)

eval :: Exp -> Value
-- 
--   eval (BoolLit True) == (BV True)
--   eval (IntLit 5) == (IV 5)
--   eval (Sub (IntLit 5) (IntLit 4)) == (IV 1)  
--   eval (Equal (BoolLit True) (BoolLit False))
--     == (BV False)
--   eval (If (BoolLit True) (IntLit 4) (IntLit 5))
--     == (IV 4)

-- base cases

eval (BoolLit b) = (BV b)
eval (IntLit x)  = (IV x)

-- base case
eval (Sub (IntLit x) (IntLit y)) = (IV (x - y))  
 
-- type errors
eval (Sub e1 e2) = do
     let e = (eval e1, eval e2)
     case e of 
     	  ((IV a), (IV b)) -> eval (Sub (IntLit a) (IntLit b))
	  _                -> Wrong

eval (Equal e1 e2) = do 
     let e = (eval e1, eval e2)
     case e of 
     	  ((BV b1), (BV b2)) -> BV (b1==b2)
	  ((IV i1),(IV i2))  ->  BV (i1==i2)
	  _                  -> Wrong
          	  	  
eval (If c e1 e2) = do 
     case (eval c) of 
     	  (BV True)  -> eval e1
	  (BV False) -> eval e2
	  _      -> Wrong

