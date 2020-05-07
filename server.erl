-module(server).

-export([start/0,init/0]).

start() ->
    spawn(server,init,[]).

init() ->
    register(server,self()),
    Resources = hw:get_resources(),
    io:format("hna############## ~p ~n",[Resources]),
    loop(Resources).

loop(ResDB) ->
    receive
	{request, _From, alloc} ->
	    {Resource, NewResDB} = hw:alloc(ResDB),
	    io:format("hank############## ~p ~n",[Resource]),
	    _From ! {reply, Resource},
	    loop(NewResDB);
	{request, _From, {free, Resource}} ->
	    NewResDB = hw:free(Resource, ResDB),
	    io:format("yarab ############# ~p ~n",[NewResDB]),
	    _From ! {replay, ok},
	    loop(NewResDB);
	_Other ->
	    loop(ResDB)
    end.
