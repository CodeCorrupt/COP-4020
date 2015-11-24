-module(lib_misc).
-export([on_exit/2,start/1,keep_alive/2,test/0,err_msg/2]).

% performing an action when a process dies

on_exit(Pid, Fun) ->
    spawn(fun() ->
		  Ref = monitor(process, Pid),
		  receive
		      {'DOWN', Ref, process, Pid, Why} ->
			  Fun(Pid, Why)
		  end
    end).


% starting multiple processes and linking them together

start(Fs) ->
    spawn(fun() ->
		  [spawn_link(F) || F <- Fs],
		  receive
		      after
			  infinity ->
			       true
		  end
	  end).


keep_alive(Name, Fun) ->
    register(Name, Pid = spawn(Fun)),
    on_exit(Pid, fun(_Pid, _Why) ->
			 keep_alive(Name, Fun) end).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test() -> 	       
    receive
	X ->
	    list_to_atom(X)
    end.

err_msg(Pid, Why) ->
    io:format("The process ~p died due to error:~p~n",[Pid,Why]).



