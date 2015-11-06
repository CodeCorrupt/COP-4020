-module(passing).
-export([main/0,f/1]).

f(Y) ->
    Y = 4.  % show what happens when Y is changed to 4

main() ->
    X = 3,  % removing this results in an error "'X' is unbound."
    f(X),
    X.
