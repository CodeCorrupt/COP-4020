import Parser
import Expressions

parser :: Parse Char Expr
parser = litParse `alt` opExpParse

opExpParse
  = (token '('  >*>
     parser     >*>
     spot  isOp >*>
     parser     >*>
     token ')')
     `build` makeExpr

makeExpr (_,(e1,(bop,(e2,_)))) = Op (charToOp bop) e1 e2

litParse 
  = (neList (spot isDigit))
    `build` charlistToExpr
    --`build` ((charlistToExpr . uncurry (++))

charToOp '+' = Add
charToOp '-' = Sub
charToOp '*' = Mul
charToOp '/' = Div

isOp '+' = True
isOp '-' = True
isOp '*' = True
isOp '/' = True
isOp _   = False

charlistToExpr :: [Char] -> Expr
charlistToExpr s = Lit (read s)

