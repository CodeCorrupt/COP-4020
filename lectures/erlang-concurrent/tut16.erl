% Erlang provides a mechanism for processes to be given names
% so that these names can be used as identities instead of pids.

% This is important because processes that need to know each other 
% are often started independently of each other.

-module(tut16).

-export([start/0, ping/1, pong/0]).

ping(0) ->
    pong ! finished,
    io:format("Ping finished~n",[]);

ping(N) -> 
    pong ! {ping, self()},
    receive
	pong ->
	    io:format("Ping received pong~n", [])
    end,
    ping(N-1).

pong() ->
    receive
	finished ->
	    io:format("Pong finished~n", []);
	{ping, Ping_PID} ->
	    io:format("Pong received ping~n", []),
	    Ping_PID ! pong,
	    pong()
    end.

start() ->
    register(pong, spawn(tut16, pong, [])),
    spawn(tut16, ping, [3]).

