-module(db).
-export([start/1,stop/1,retrieve/2,insert/3]).

start(Name) ->
    register(Name, spawn(fun() ->
                    loop(Name)
            end)
    ),
    {started}.


insert(Name, Key, Value) ->
    rpc(Name, {insert, Key, Value}).

retrieve(Name, Key) ->
    rpc(Name, {retrieve, Key}).

stop(Name) ->
    rpc(Name, {stop}).

rpc(Name, Request) -> % Remote Procedure Call
    
   Name ! {self(), Request},
    receive
        {Name, Reply} ->
            Reply
    end.

loop(Name) ->
    receive
        {Client, {insert, Key, Value}} ->
            put(Key, Value),
            Client ! {Name, done},
            loop(Name);
        {Client, {retrieve, Key}} ->
            Client ! {Name, get(Key)},
            loop(Name);
        {Client, {stop}} ->
            Client ! {Name, stopped}
    end.
