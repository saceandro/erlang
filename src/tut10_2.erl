-module(tut10_2).
-export([convert_length/1]).

convert_length(Length) ->
    if Length == {centimeter, X} ->
	    {inch, X / 2.54};
       Length == {inch, Y} ->
	    {centimeter, Y * 2.54}
    end.
