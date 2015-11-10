-module(mylength).
-export([lenFR/1,lenTR/1]).

lenFR([])    -> 0;
lenFR([_|T]) -> 1 + lenFR(T).

lenTR(Ls) -> lenTR(Ls,0).

lenTR([],N)    -> N;
lenTR([_|T],N) -> lenTR(T,N+1).

