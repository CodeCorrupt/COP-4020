-module(mathserver).
-export([start/0,compute/3]).

start() ->
    spawn(fun mserver/0).

% Math server sends a message of the form {ok,Val}
% to Pid, where Val = math:f(math:g(... (math:h(X)) ...))
% when it receives messages of the form:
% {Pid, compute, [f, g, ..., h], X}

mserver() ->
    receive {Pid, compute, Funs, Arg} ->
	    Pid ! {ok, accumulate(lists:reverse(Funs), Arg)},
	    mserver()
    end.

accumulate([],Acc) ->
    Acc;

accumulate([F|Fs], Acc) ->
    accumulate(Fs, math:F(Acc)).

compute(P,Funs,Val) ->
    P ! {self(), compute, Funs, Val},
    receive
	{ok, Res} -> Res
    end.


% we can use the mathserver by running
%  P = mathserver:start().
%  mathserver:compute(P, [sin,cos], 1.0).


