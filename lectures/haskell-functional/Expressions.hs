module Expressions where

data Expr = Lit Integer |
            Op Ops Expr Expr
              deriving (Show)

data Ops  = Add | Sub | Mul | Div
              deriving (Show)

eval :: Expr -> Integer
eval (Lit n)        = n
eval (Op Add e1 e2) = (eval e1) + (eval e2)
eval (Op Sub e1 e2) = (eval e1) - (eval e2)
eval (Op Mul e1 e2) = (eval e1) * (eval e2)
eval (Op Div e1 e2) = (eval e1) `div` (eval e2)


--instance Show Expr where
--  show (Lit n)        = show n
--  show (Op Add e1 e2) = "(" ++ show e1 ++ "+" ++ show e2 ++ ")"
--  show (Op Sub e1 e2) = "(" ++ show e1 ++ "-" ++ show e2 ++ ")"
--  show (Op Mul e1 e2) = "(" ++ show e1 ++ "*" ++ show e2 ++ ")"
--  show (Op Div e1 e2) = "(" ++ show e1 ++ "/" ++ show e2 ++ ")"

-- sample expressions

e1 = (Lit 10)
e2 = (Op Add (Lit 10) (Lit 20))
e3 = (Op Mul (Lit 10) (Op Add (Lit 2) (Lit 3)))
