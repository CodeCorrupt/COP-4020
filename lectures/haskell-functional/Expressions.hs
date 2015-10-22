module Expressions where

import Store 
import Data.Maybe

type Var = Char

data Expr =   Lit Integer 
            | Var Var     
            | Op Ops Expr Expr
              deriving (Show)

data Ops  = Add | Sub | Mul | Div
              deriving (Show)

eval :: Expr -> (Store Var Expr) -> Integer
eval (Lit n)        _       = n

eval (Var var_name) context 
  | isNothing var_value     = error "variable undefined"
  | otherwise               = eval (fromJust var_value) context
  where 
    var_value = value context var_name

eval (Op Add e1 e2) context = (eval e1 context) +     (eval e2 context)
eval (Op Sub e1 e2) context = (eval e1 context) -     (eval e2 context)
eval (Op Mul e1 e2) context = (eval e1 context) *     (eval e2 context)
eval (Op Div e1 e2) context = (eval e1 context) `div` (eval e2 context)


--instance Show Expr where
--  show (Lit n)        = show n
--  show (Var var_name) = show "Var " ++ show var_name
--  show (Op Add e1 e2) = "(" ++ show e1 ++ "+" ++ show e2 ++ ")"
--  show (Op Sub e1 e2) = "(" ++ show e1 ++ "-" ++ show e2 ++ ")"
--  show (Op Mul e1 e2) = "(" ++ show e1 ++ "*" ++ show e2 ++ ")"
--  show (Op Div e1 e2) = "(" ++ show e1 ++ "/" ++ show e2 ++ ")"

-- sample expressions

e1 = (Lit 10)
e2 = (Op Add (Lit 10) (Lit 20))

-- sample global context

context :: Store Var Expr
context = update (update initial 'a' e1) 'b' e2

