%%%-------------------------------------------------------------------
%%% @author Piotr
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. kwi 2017 09:49
%%%-------------------------------------------------------------------
-module(pingpong).
-author("Piotr").

%% API
-export([start/0, ping_loop/0, pong_loop/0, stop/0, play/1]).

start() ->
  register(ping,spawn(?MODULE,ping_loop,[])),
  register(pong,spawn(?MODULE,pong_loop,[])).

play(N) ->
  case whereis(ping) of
    undefined -> start(), pong ! N;
    _ -> pong ! N
  end.

ping_loop()->
  receive
    0 -> io:format("Ping : 0~n"), ping_loop();
    stop -> io:format("Finished after stop. ~n"), ok;
    N -> io:format("Ping : ~B~n",[N]), pong ! N-1, ping_loop()
  after
    20000 -> io:format("Finished after after. ~n")
  end.

pong_loop()->
  receive
    0 -> io:format("Pong : 0~n"), pong_loop();
    stop -> io:format("Finished after stop. ~n"), ok;
    N -> io:format("Pong : ~B~n",[N]), ping ! N-1, pong_loop()
  after
    20000 -> io:format("Finished after after. ~n")
  end.

stop() ->
  ping ! stop,
  pong ! stop.