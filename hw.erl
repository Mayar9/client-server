-module(hw).

-export([get_resources/0,alloc/1,free/2]).



get_resources() ->
    ResDB=[1,2,3,4,5],
    ResDB.



alloc([]) ->
    {noResources, []};

alloc([H | T]) ->
    {H, T}.



free(Resource,ResDB) ->
    ResourcesDB=[1,2,3,4,5],
    State = searchOnMember:search(Resource,ResourcesDB),
    if
	State == true ->
	    [Resource | ResDB];
        State == false ->
	     ResDB;
	true ->
	    io:format("something happened wrong ~n",[])
     end.
    
    
    
%%free(Resource,ResDB) ->
%%    [Resource | ResDB].
    
