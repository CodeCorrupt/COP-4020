data Expr =   Lit Integer 
            | Inc Expr  
            | Dec Expr  
            | Add Expr Expr 
            | Sub Expr Expr 
            | Mul Expr Expr 
            | Div Expr Expr 

eval :: Expr -> Integer

eval (Lit m)     = m
eval (Inc e)     = succ $ eval e
eval (Dec e)     = pred $ eval e
eval (Add e1 e2) = (eval e1) + (eval e2)
eval (Sub e1 e2) = (eval e1) - (eval e2)
eval (Mul e1 e2) = (eval e1) * (eval e2)
eval (Div e1 e2) = (eval e1) `div` (eval e2)

