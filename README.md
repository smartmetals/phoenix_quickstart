# Phoenix Docker Quickstart

A docker compose setup with Phoenix 1.3, Elixir 1.5, Erlang 20.0.

Install Docker: https://www.docker.com/get-docker

##
Initial setup:

```shell
git clone https://github.com/smartmetals/phoenix_quickstart
cd phoenix_quickstart
source functions.sh
phx-new myappname
```

Note that your app name must start with a letter and have only lowercase letters, numbers and underscore.

Answer yes to the questions about installing dependencies.

Open `projects/myappname/config/dev.exs` and change the db `:hostname` to "db"

Note below commands use the sourced function `dmix`, not `mix` directly.

```
dmix ecto.create
dserver # docker-compose up
```

Browse: https://localhost:4000


If you start a new shell, `source functions.sh` again and run phx-init `myappname`.

Start a repl with `diex`. Run any command in the web container with `drun`.

## Credit
Most of the work in this repo was originally done by others:

https://github.com/marcelocg/phoenix-docker
https://github.com/rbeene/phoenix-with-docker

