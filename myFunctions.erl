%% @author Piotr
%% @doc @todo Add description to myFunctions.



-module(myFunctions).

%% ====================================================================
%% API functions
%% ====================================================================
-export([power/2, divisibleBy/2, cont/2, contains/2, duplicateElements/1, toBinary/1, onp/1]).

power(_,0) -> 1;
power(A,N) -> A*power(A,N-1).

contains([],_) -> false;
contains([H|T],A) ->
	if
		H == A -> true;
		true -> contains(T,A)
	end.

divisibleBy([],_) -> [];
divisibleBy([H|T],Div) when ((H rem Div) == 0) -> [H] ++ divisibleBy(T,Div); 
divisibleBy([_|T],Div) -> divisibleBy(T,Div).

cont(_,[]) -> false;
cont(X,[X|_]) -> true;
cont(X,[_|T]) -> cont(X,T).

duplicateElements([]) -> [];
duplicateElements([H|T]) -> [H] ++ [H] ++ duplicateElements(T).

toBinary(0)->[0];
toBinary(1)->[1];
toBinary(N)->toBinary(trunc(N/2)) ++ [N rem 2].

onp(L) -> calc(string:tokens(L," "),[]).
	

%% ====================================================================
%% Internal functions
%% ====================================================================

calc([],[X])->X;
calc(["+"|T1],[H1,H2|T])->calc(T1,[H2+H1] ++ T);
calc(["-"|T1],[H1,H2|T])->calc(T1,[H2-H1] ++ T);
calc(["*"|T1],[H1,H2|T])->calc(T1,[H2*H1] ++ T);
calc(["/"|T1],[H1,H2|T])->calc(T1,[H2/H1] ++ T);
calc(["pow"|T1],[H1,H2|T])->calc(T1,[power(H2,H1)] ++ T);
calc(["sqrt"|T1],[H|T])->calc(T1,[math:sqrt(H)] ++ T);
calc(["sin"|T1],[H|T])->calc(T1,[math:sin(H)] ++ T);
calc(["cos"|T1],[H|T])->calc(T1,[math:cos(H)] ++ T);
calc(["tan"|T1],[H|T])->calc(T1,[math:tan(H)] ++ T);
calc([H|T],Lista) ->
	case cont($.,H) of
		true  -> calc(T,[list_to_float(H)] ++ Lista);
		false -> calc(T,[list_to_integer(H)] ++ Lista)
	end.



















