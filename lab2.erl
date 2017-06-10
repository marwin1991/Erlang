%% @author Piotr
%% @doc @todo Add description to lab2.


-module(lab2).

%% ====================================================================
%% API functions
%% ====================================================================
-export([qs/1, randomElems/3,compareSpeeds/3]).

lessThan(List,Arg) -> [X || X <-List, X < Arg].

grtEqThan(List, Arg) -> [X || X<-List, X >= Arg].

qs([]) -> [];
qs([Pivot|Tail]) -> qs( lessThan(Tail,Pivot) ) ++ [Pivot] ++ qs( grtEqThan(Tail,Pivot) ). 

randomElems(N,Min,Max) -> [ random:uniform(Max-Min)+Min || _ <- lists:seq(1,N)].

%% tutaj przetestowac i io:format zrobic w domu
compareSpeeds(List, Fun1, Fun2) -> {timer:tc(Fun1,[List]), timer:tc(Fun2, [List])}.

%% ====================================================================
%% Internal functions
%% ====================================================================


