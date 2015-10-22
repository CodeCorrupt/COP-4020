module CommandLine where

import Parser
import Expressions
import ExpressionsParser

data Command = Eval Expr | Assign Var Expr | Null
                 deriving (Show)

commandParse :: Parse Char Command

commandParse = evalParser `alt` assignParser 

evalParser :: Parse Char Command
evalParser = parser `build` Eval

assignParser :: Parse Char Command
assignParser = ((spot isVar) >*> (token ':') >*> parser) `build`
               makeAssign

--makeAssign (var,(_,expr)) = Assign var expr
makeAssign t = Assign (fst t) ((snd . snd) t)