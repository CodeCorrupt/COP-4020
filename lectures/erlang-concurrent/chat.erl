-module(chat).

-export([start_broadcaster/0, broadcaster/1,sender/2, start_receiver/1,receiver/0]).

sender(Broadcaster_Node, Name) ->
    Line = io:get_line("$ "),
    %io:format("You entered: ~s", [Line]),
    if
	Line =:= "END\n" -> 
	    finished;
	true ->
	    {broadcaster, Broadcaster_Node} ! 
		string:concat(Name, string:concat("> ", Line)),
	    sender(Broadcaster_Node, Name)
    end.
%%

receiver() ->
    receive
	Line ->
	    io:format("~s", [Line])
    end,
    receiver().

start_receiver(Broadcast_Node) ->
    io:format("Receiver started~n",[]), 
    Receiver_PID = spawn(chat, receiver, []),
    {broadcaster, Broadcast_Node} ! {join, Receiver_PID}.

%%    

sendToAllReceivers(_, []) ->
    done;

sendToAllReceivers(Line, [Receiver_PID|Receiver_PID_Rest]) ->
    Receiver_PID ! Line,
    sendToAllReceivers(Line, Receiver_PID_Rest).

broadcaster(Receiver_PID_List) ->
    receive
	{join, New_Receiver_PID} ->
	    broadcaster([New_Receiver_PID|Receiver_PID_List]);
	Line ->
	    io:format("~s", [Line]),
	    sendToAllReceivers(Line, Receiver_PID_List),
	    broadcaster(Receiver_PID_List)
    end.

start_broadcaster() ->
    io:format("Broadcaster started~n",[]),
    register(broadcaster, spawn(chat, broadcaster, [[]])).
