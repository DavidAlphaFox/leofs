%%
%% pmap_clnt was generated by erpcgen (do not edit)
%%
-module(pmap_clnt).
-include("pmap.hrl").
-export([pmapproc_null_2/1,pmapproc_null_2/2]).
-export([pmapproc_set_2/2,pmapproc_set_2/3]).
-export([pmapproc_unset_2/2,pmapproc_unset_2/3]).
-export([pmapproc_getport_2/2,pmapproc_getport_2/3]).
-export([pmapproc_dump_2/1,pmapproc_dump_2/2]).
-export([pmapproc_callit_2/2,pmapproc_callit_2/3]).

pmapproc_callit_2(Clnt, _1) ->
    pmapproc_callit_2(Clnt, _1, infinity).

pmapproc_callit_2(Clnt, _1, Timeout) ->
    _2 = [pmap_xdr:enc_call_args(_1)],
    case nfs_rpc_client:call(Clnt, 5, _2, Timeout) of
        {ok,_3} ->
            {Reply,_} = pmap_xdr:dec_call_result(_3, 0),
            {ok,Reply};
        Error ->
            Error
    end.

pmapproc_dump_2(Clnt) ->
    pmapproc_dump_2(Clnt, infinity).

pmapproc_dump_2(Clnt, Timeout) ->
    _1 = [],
    case nfs_rpc_client:call(Clnt, 4, _1, Timeout) of
        {ok,_2} ->
            {Reply,_} = pmap_xdr:dec_pmaplist(_2, 0),
            {ok,Reply};
        Error ->
            Error
    end.

pmapproc_getport_2(Clnt, _1) ->
    pmapproc_getport_2(Clnt, _1, infinity).

pmapproc_getport_2(Clnt, _1, Timeout) ->
    _2 = [pmap_xdr:enc_mapping(_1)],
    case nfs_rpc_client:call(Clnt, 3, _2, Timeout) of
        {ok,_3} ->
            {Reply,_} =
                begin
                    <<_:0/binary,_4:32/unsigned,_/binary>> = _3,
                    {_4,0 + 4}
                end,
            {ok,Reply};
        Error ->
            Error
    end.

pmapproc_unset_2(Clnt, _1) ->
    pmapproc_unset_2(Clnt, _1, infinity).

pmapproc_unset_2(Clnt, _1, Timeout) ->
    _2 = [pmap_xdr:enc_mapping(_1)],
    case nfs_rpc_client:call(Clnt, 2, _2, Timeout) of
        {ok,_3} ->
            {Reply,_} =
                begin
                    begin
                        <<_:0/binary,_5:32/unsigned,_/binary>> = _3,
                        _4 =
                            if
                                _5 == 0 ->
                                    false;
                                _5 == 1 ->
                                    true
                            end
                    end,
                    {_4,0 + 4}
                end,
            {ok,Reply};
        Error ->
            Error
    end.

pmapproc_set_2(Clnt, _1) ->
    pmapproc_set_2(Clnt, _1, infinity).

pmapproc_set_2(Clnt, _1, Timeout) ->
    _2 = [pmap_xdr:enc_mapping(_1)],
    case nfs_rpc_client:call(Clnt, 1, _2, Timeout) of
        {ok,_3} ->
            {Reply,_} =
                begin
                    begin
                        <<_:0/binary,_5:32/unsigned,_/binary>> = _3,
                        _4 =
                            if
                                _5 == 0 ->
                                    false;
                                _5 == 1 ->
                                    true
                            end
                    end,
                    {_4,0 + 4}
                end,
            {ok,Reply};
        Error ->
            Error
    end.

pmapproc_null_2(Clnt) ->
    pmapproc_null_2(Clnt, infinity).

pmapproc_null_2(Clnt, Timeout) ->
    _1 = [],
    case nfs_rpc_client:call(Clnt, 0, _1, Timeout) of
        {ok,_2} ->
            {Reply,_} = {void,0},
            {ok,Reply};
        Error ->
            Error
    end.
