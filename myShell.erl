%%%-------------------------------------------------------------------
%%% @author Piotr
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. kwi 2017 18:37
%%%-------------------------------------------------------------------
-module(myShell).
-author("Piotr").

%% API
-export([set/0]).

set() -> c:cd("c:/Users/Krzysztof/Desktop/erlang/labs/src").