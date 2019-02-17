-module(tut13).
-export([convertListToC/1]).

convertToC({Name, {f, Temp}}) -> 
		  {Name, {c, trunc((Temp-32) * 5/9)}};
convertToC({Name, {c, Temp}}) ->
    {Name, {c, Temp}}.

convertListToC(List) ->
    NewList = lists:map(fun convertToC/1, List),
    lists:sort(fun({_, {c, Temp1}}, {_, {c, Temp2}}) ->
		       Temp1 < Temp2 end, NewList).
