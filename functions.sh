#sourceable functions

phx-new() {
    phx-init $1
    mkdir -p "$PWD/projects/$1"
    docker-compose run web mix phx.new $1
}

phx-init() {
    export PROJECTS="$PWD/projects:/projects"
    export PHOENIX13_PROJECT="$1"
}

drun() {
    docker-compose run web "$@"
}

dmix () {
    docker-compose run web mix "$@"
}

dserver () {
    docker-compose up
}
