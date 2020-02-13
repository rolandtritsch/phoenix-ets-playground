# Testing ETS, DETS and Mnesia

To make this work you need to ...

* install elixir, mix, ...
* fork the repo
* run `mix test`

You can then (also) ...

* run `mix phx.server` and hit it with ...
  * `curl -s -X GET "http://localhost:4000/start"`
  * `curl -s -X GET "http://localhost:4000/add"`
  * `curl -s -X GET "http://localhost:4000/add"`
  * `curl -s -X GET "http://localhost:4000/stop"`
* ... to see the dump in the server log
