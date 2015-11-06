-module(printclients).
-export([print/2, status/1]).

% function for client use in the printserver example

% send a print job to the spooler, and return the job number
print(Spooler, Str) ->
    Spooler!{self(), print, Str},
    receive
	{job_received, N} ->
	    N;
	Msg -> io:format("print bad message received: ~p~n", [Msg])
    end.

status(Spooler) ->
    Spooler!{self(), status},
    receive
	{status, Msg} -> Msg;
	Msg -> io:format("status bad message received: ~p~n", [Msg])
    end.
