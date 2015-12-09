Data Expr :: Lit Integer
    | Inc Expr Expr
    | Dec Expr Expr
    | Add Expr Expr
    | Sub Expr Expr
    | Mul Expr Expr
    | Div Expr Expr

eval :: Expr -> Integer
