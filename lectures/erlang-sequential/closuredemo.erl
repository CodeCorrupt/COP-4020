-module(closuredemo).
-export([cadd/1,main/0]).

main() ->
    (cadd(5))(3).

cadd(N) ->
    fun(M) ->
	    N + M 
    end.

