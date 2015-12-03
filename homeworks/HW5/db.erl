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
        {Client, {insert, Key, Value}} ->
            put(Key, Value),
            Client ! {db, done},
            loop();
        {Client, {retrieve, Key}} ->
            Client ! {db, get(Key)},
            loop();
        {Client, {stop}} ->
            Client ! {db, stopped}
    end.
