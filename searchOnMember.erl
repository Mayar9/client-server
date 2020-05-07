-module(searchOnMember).

-export([search/2]).

search(Element,List) ->
	search_2(Element,List).


search_2(H,[H|_]) ->
	true;

search_2(H,[_|T]) ->
	search_2(H,T);

search_2(_,[]) ->
	false.
