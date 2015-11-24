-module(ring).

-export([measure/1,start/1]).

sendNeighborPID(PID, [H]) ->
    H ! PID,
    H;

sendNeighborPID(PID, [H|R]) ->
    H ! PID,
    sendNeighborPID(H, R).

measure(N) -> 
    statistics(runtime),
    statistics(wall_clock),
    start(N),
    {_,Time1} = statistics(runtime),
    {_,Time2} = statistics(wall_clock),
    U1 = Time1 / 1000,
    U2 = Time2 / 1000,
    io:format("Total runtime time   =~p seconds~n", [U1]),
    io:format("Total wall clock time=~p seconds~n", [U2]).


start(N) ->
    List = for(1, N, fun() -> spawn(fun() -> waitForNeighborPID() end) end),
    io:format("Spawned processes~n"),
    Last = sendNeighborPID(self(), List),
    io:format("Created ring topology~n"),
    Last ! ping,
    io:format("Sent ping~n"),
    receive
	ping ->
	    io:format("Received ping~n")
    end.

waitForNeighborPID() ->
    receive
	NeighborPID ->
	    waitForPing(NeighborPID)
    end.

waitForPing(NeighborPID) ->
    receive
	ping ->
	    NeighborPID ! ping
    end.

for(N, N, F) ->
    [F()];
for(I, N, F) ->
    [F()|for(I+1, N, F)].





