COP 4020 Lecture -*- Outline -*-

> module HigherOrder where

* Higher-Order Programming

  Much of this is based on van Roy and Haridi's book 
  "Concepts, Techniques and Methods of Computer Programming", chapter 3

------------------------------------------
  def: the *order* of a function f is 
          1+(maximum order of f's arguments),
       where the order of a non-function argument is 0.

  def: A function is *higher-order* if its order is greater than 1.

Examples:

> map' :: (a -> b) -> [a] -> [b]
> map' _ [] = []
> map' f (x:xs) = f x : map' f xs

> foldr' :: (a -> b -> b) -> b -> [a] -> b
> foldr' op z [] = z
> foldr' op z (x:xs) = x `op` (foldr' op z xs) 

------------------------------------------

** Basic Operations (3.6.1)

   Q: What are the 4 basic operations of higher-order programming?
------------------------------------------
   4 KINDS OF HIGHER-ORDER PROGRAMMING

1. procedural abstraction: converting expressions to functions
    (Liskov & Guttag's abstraction by parameterization)

2. genericity: passing functions as arguments
    (abstracting out expressions, not just data)

3. instantiation: returning function values as results
    (creation of new functions)

4. embedding: putting functions in data structures

------------------------------------------

*** procedural abstraction

    Q: How can you make an expression e into a function?

       (\() -> e)

       this freezes execution (makes a closure, or thunk)

    Q: Suppose we want two variants of a function that are similar,
       but differ a bit?

       Use arguments

*** genericity

**** for tail recursion

     We did this already for list recursions, as foldr
     and for tree recursion

------------------------------------------
     ABSTRACTION OF TAIL RECURSION

Consider

> sumFromTo i j = sumFromToIter (j,0)
>    where sumFromToIter (j,r) =
>            if i > j then r else sumFromToIter (j-1,r+j)

> sqrt x = sqrtIter 1.0
>    where sqrtIter guess =
>            if goodEnough guess then guess
>            else sqrtIter (improve guess)
>          goodEnough guess = abs(guess*guess - x) < 0.0001
>          improve guess = (guess+(x/guess))/2.0

What do the ...Iter functions have in common?


How do they differ?



Can we make the differences arguments?











    
------------------------------------------

    ... general outline, returning part of state (R or Guess)
        Passing new value to state in recursion

    ... test for being done i > j or GoodEnough,
        how to extract the result from the state,
        how to transform the state

    ... yes

> -- curried
> tailrec :: (a -> Bool) -> (a -> b) -> (a -> a) -> a -> b
> tailrec isDone extract transform s = loop s
>   where loop s = 
>           if (isDone s) then (extract s)
>           else loop (transform s)

       
      How would you write sqrtIter using tailrec? sumFromToIter?

        sqrtIter' = tailrec goodEnough id improve
        sumFromToIter' = tailrec (\(j,_) -> i > j)
                         (\(_,r) -> r)
                         (\(j,r) -> (j-1,r+j))


*** instantiation (currying)

------------------------------------------
 INSTANTIATION or RULES THAT PRODUCE RULES

Aka:
 factories, generators, curried functions

Examples:

> makeSort comp = (\ls -> qsort comp ls)
> qsort _ [] = []
> qsort comp (x:xs) = (qsort comp less) ++ [x] 
>                     ++ (qsort comp greater)
>      where less = [y | y <- xs, y `comp` x]
>            greater = [y | y <- xs, not (y `comp` x)]

Use of makeSort:

> sortGT = makeSort (>)

  sortGT list1
  sortGT list2
  ...
------------------------------------------

------------------------------------------
        AN EXAMPLE: COMPOSE

Write the function compose such that:

  ((compose head tail) [1,2,3])
        == head (tail [1,2,3])
	== head [2,3]
	== 2

   ((compose not null) [])
	== not (null [])
	== False

How to write this:








------------------------------------------

        Show how to generalize these examples to get the answer.

        First generalize the examples:

        in general 

            ((compose f g) x) == f (g x)

        So

	(compose f g) is a function of one argument, x,
		so it must be

			(\x -> f (g x))

	But compose itself is a function, of two arguments, f and g,
		and when called it returns this other procedure, so...

             compose f g = (\x -> f (g x))


------------------------------------------
        SUMMARY OF STEPS FOR 
   MAKING A HIGHER-ORDER FUNCTION

 1. Starting from examples, name the roles
 2. Generalize the result expression,
    using role names, write it down
 3. Wrap lambda (\ -> ) declarations around it,
    corresponding to the arguments

------------------------------------------

------------------------------------------
	   FOR YOU TO DO

Write a function twice

  twice :: (a -> a) -> a -> a

Examples:

   (twice not) True
	== not (not True)
	== True
   (twice (+1)) 3
	== (+1) ((+1) 3)
	== 5












------------------------------------------

	Hints: What's the general formula?
        (twice f) x == f (f x)
        

*** embedding
------------------------------------------
            EMBEDDING

Putting closures in data is useful for:

  - explicit lazy evaluation

  - objects = records of operations

  - classes, functions that return objects

  - manipulating actions as data
      (e.g., in testing)

------------------------------------------

        This is also the basic OO paradigm

------------------------------------------
         EXAMPLE: INFINITE SEQUENCES

Write the following functions to implement (Seq a)

repeating :: (Num a) => a -> (Seq a)
generate :: (Num a) => (Integer -> a) -> (Seq a)
nth :: (Num a) => Integer -> (Seq a) -> a
add :: (Num a) => (Seq a) -> (Seq a) -> (Seq a)

For example:

ones = (repeating 1)

halves = generate (\n -> 1.0/(2.0^(fromInteger n)))

(nth halves 0) ~=~ 1.0
(nth halves 1) ~=~ 0.5
(nth halves 2) ~=~ 0.25
(nth halves 3) ~=~ 0.125
(nth halves 30) ~=~ 9.313225746154785e-10

------------------------------------------
          See Seq.hs and SeqTests.hs

    Q: How can we represent something infinite in a computer?
    As a rule, i.e., as a function.

    Here we will use rules of type 
       Integer -> a,    where (Num a)
    to represent the type (Seq a)

    The idea is that, e.g.,

       (\n -> n*n)

    represents the sequence 0, 1, 4, 9, 16, 25, ...
