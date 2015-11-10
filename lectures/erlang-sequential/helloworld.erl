-module(helloworld).
-export([greeting/0]).

greeting() ->
     io:format("Hello, world!~n").
