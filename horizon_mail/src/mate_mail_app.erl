-module(mate_mail_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
	application:start(lager),
	application:start(crypto),
	application:start(asn1),
	application:start(public_key),
	application:start(ssl),
	application:start(mail_client),
    mate_mail_sup:start_link().

stop(_State) ->
    ok.
