#sourceable functions

phx-new() {
    phx-init $1
    mkdir -p $PROJECTS
    check-image $PWD
    docker run -it --rm -v $PROJECTS -w /projects phoenix13 mix phx.new $1
}

check-image() {
    echo 'checking for docker image...'
    installed=`docker images | grep phoenix13`
    echo $installed
    [[ $installed = *[![:space:]]* ]] || echo "installing docker image" && docker build -t phoenix13 $1
}

phx-init() {
    export PROJECTS="$PWD:/projects"
    export PHOENIX13_PROJECT="$1"
}

drun() {
    docker run -it --rm -v $PROJECTS -w "/projects/$PHOENIX13_PROJECT" phoenix13 "$@"
}

dmix () {
    docker run -it --rm -v $PROJECTS -w "/projects/$PHOENIX13_PROJECT" phoenix13 mix "$@"
}


