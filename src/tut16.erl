-module(tut16).
-export([start/0, ping/1, pong/0]).

ping(0) ->
    io:format("ping pid: ~p~n", [self()]),
    pong ! finished,
    io:format("ping finished~n", []);
ping(N) ->
    io:format("ping pid: ~p~n", [self()]),
    pong ! {ping, self()},
    receive
	pong ->
	    io:format("Ping received pong~n", [])
    end,
    ping(N-1).

pong() ->
    io:format("pong pid: ~p~n", [self()]),
    receive
	finished ->
	    io:format("Pong finished~n", []);
	{ping, Ping_PID} ->
	    io:format("Pong received ping~n", []),
	    Ping_PID ! pong,
	    pong()
    end.

start() ->
    spawn(tut16, ping, [3]),
    register(pong, spawn(tut16, pong, [])).

