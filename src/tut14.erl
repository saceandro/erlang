-module(tut14).
-export([start/0, saySomething/2]).

saySomething(_, 0) ->
    done;
saySomething(What, Times) ->
    io:format("~p~n", [What]),
    saySomething(What, Times-1).

start() ->
    spawn(tut14, saySomething, [hello, 3]),
    spawn(tut14, saySomething, [goodbye, 3]).
