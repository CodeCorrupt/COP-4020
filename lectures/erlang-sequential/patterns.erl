-module(patterns).
-export([matchlist/1]).

% Which clause matches what?
matchlist([Elems]) ->
    {first, Elems};
matchlist(Arg) when is_list(Arg) -> {middle,Arg};
matchlist(Lst) ->
    {second, Lst}.




