-module(lib_misc).
-export([test/0,on_exit/2]).

on_exit(Pid, Fun) ->
    spawn(fun() ->
		  Ref = monitor(process, Pid),
		  receive
		      {'DOWN', Ref, process, Pid, Why} ->
			  Fun(Why)
		  end
    end).

test() -> 
    receive
	X ->
	    list_to_atom(X)
    end.

%F = fun() -> 
%	    receive
%		X ->
%		    list_to_atom(X)
%	    end
%    end.



