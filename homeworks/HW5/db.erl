-module(db).
-export([start/0,stop/0,retrieve/1,insert/2,custom/1]).

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

custom(Pul) ->
    rpc(Pul).

rpc(Request) ->
    db ! {self(), Request},
    receive
	{db, Reply} ->
	    Reply
    end.

loop() ->
    receive
        {Client, {insert, Key, Value}} ->
            Client ! {db, write_error};
        {Client, {retrieve, Key}} ->
            Client ! {db, read_error};
        {Client, {stop}} ->
            Client ! {db, stop};
        {Client, Catch} ->
            Client ! {db, 'the fuck did you enter?'}
    end.
