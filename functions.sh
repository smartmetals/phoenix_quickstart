#sourceable functions

phx-new() {
    phx-init $1
    mkdir -p "$PWD/projects/$1"
    docker-compose run web bash -c "cd .. && rm -r $1 && mix phx.new $1"
}

phx-init() {
    export PROJECTS="$PWD/projects:/projects"
    export PHOENIX13_PROJECT="$1"
}

drun() {
    if [[ -z ${PHOENIX13_PROJECT+x} ]]; then
        echo "PHOENIX13_PROJECT is unset. Please run phx-init <appname>"
        return
    fi
    docker-compose run web "$@"
}

dmix () {
    if [[ -z ${PHOENIX13_PROJECT+x} ]]; then
        echo "PHOENIX13_PROJECT is unset. Please run phx-init <appname>"
        return
    fi
    docker-compose run web mix "$@"
}

diex () {
    if [[ -z ${PHOENIX13_PROJECT+x} ]]; then
        echo "PHOENIX13_PROJECT is unset. Please run phx-init <appname>"
        return
    fi
    docker-compose run web iex -S mix
}

dserver () {
    if [[ -z ${PHOENIX13_PROJECT+x} ]]; then
        echo "PHOENIX13_PROJECT is unset. Please run phx-init <appname>"
        return
    fi
    docker-compose up
}
