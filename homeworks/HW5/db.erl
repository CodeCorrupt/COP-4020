-module(db).
-export([start/0,stop/0,retrieve/1,insert/2]).

start() ->
    register(db, spawn(fun() ->
			  loop() 
		  end)
	    ),
    {started}.
    

insert(Key, Value) ->
    rpc({insert, Key, Value}).

retrieve(Key) ->
    rpc({retrieve, Key}).

stop() ->
    rpc({stop}).

rpc(Request) ->
    db ! {self(), Request},
    receive
	{db, Reply} ->
	    Reply
    end.

loop() ->
    receive
	% remove the line below; it is only here so the code compiles
	_Anything -> _Anything
	% after removing the above line, put your code here
    end.
