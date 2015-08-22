The following is adapted from the "Introduction to IO"
on the Haskell Wiki (https://www.haskell.org/haskellwiki/Introduction_to_IO)

The type of a main program is an IO action

> main :: IO()
> main = do
>          putStr "Hello! What is your name? "
>          name <- getLine
>          putStrLn ("Hello, " ++ name ++ "!")
