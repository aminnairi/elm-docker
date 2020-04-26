# elm-docker

Docker image for Elm.

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/) (optional)

## Usage

### Docker

```console
$ docker run --rm --tty --interactive --user elm --volume "$PWD":/home/elm aminnairi/elm elm init
$ docker run --rm --tty --interactive --user elm --volume "$PWD":/home/elm --publish 8000:8000 aminnairi/elm elm reactor
```

### Docker Compose

```console
$ mkdir my-elm-app
$ cd my-elm-app
$ touch docker-compose.yaml
```

```yaml
version: "3"

services:
    elm:
        image: aminnairi/elm
        user: elm
        working_dir: /home/elm
        tty: true
        interactive: true
        entrypoint: elm
        ports:
            - 8000:8000
        volumes:
            - .:/home/elm
```

```console
$ docker-compose run --rm --tty --interactive elm init
$ docker-compose run --rm --tty --interactive --service-ports elm reactor
```

## Shell alias

```console
$ alias elm='docker run --rm --tty --interactive --user elm --volume "$PWD":/home/elm aminnairi/elm elm'
$ alias elmreactor='docker run --rm --tty --interactive --user elm --volume "$PWD":/home/elm --publish 8000:8000 aminnairi/elm elm reactor'
$ mkdir my-elm-app
$ cd my-elm-app
$ elm init
$ elmreactor
```

## Installation

```console
$ docker pull aminnairi/elm
```

## Uninstallation

```console
$ docker rmi -f aminnairi/elm
```

## From sources

### Requirements

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)

### Installation

```console
$ git clone https://github.com/aminnairi/elm-docker.git
$ cd elm-docker
$ make install
$ cd ..
$ mkdir my-elm-app
$ cd my-elm-app
$ docker run --rm --tty --interactive --user elm --volume "$PWD":/home/elm aminnairi/elm elm init
```

### Uninstallation

```console
$ make uninstall
```
