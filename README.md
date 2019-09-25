# elm-docker

## Requirements

- Terminal emulator (GNU/Linux & UNIX) or command prompt (Windows)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/) (optional)

## Usage

### With Docker

```bash
$ docker run --detach --publish 8000:8000 --volume "$(pwd)":/home/elm/app aminnairi/elm
```

### With Docker Compose

```bash
$ touch docker-compose.yaml
$ $EDITOR docker-compose.yaml
```

```yaml
version: "3.7"

services:
  elm:
    image: aminnairi/elm
    ports:
      - 8000:8000
    volumes:
      - .:/home/elm/app
```

```bash
$ docker-compose up --detach
```

## Configuration

### Port

The default exposed port is the port `8000`. You cannot change it. You can route all request to that port by using the `--port` argument with the `docker run` command, or the `ports` property with the `docker-compose.yaml` configuration file.

#### Examples

##### Docker

```bash
$ docker run --detach --publish 1234:8000 --volume "$(pwd)":/home/elm/app aminnairi/elm
```

##### Docker Compose

```bash
$ $EDITOR docker-compose.yaml
```

```yaml
version: "3.7"

services:
  elm:
    image: aminnairi/elm
    ports:
      - 1234:8000
    volumes:
      - .:/home/elm/app
```

### Working directory

The working directory inside the container will be located at `/home/elm/app`. Mount all needed files inside that folder using the `--volume` argument with the `docker run` command, or the `volumes` property with the `docker-compose.yaml` configuration file.

#### Examples

##### Docker

```bash
$ docker run --detach --publish 8000:8000 --volume "$(pwd)/my-app":/home/elm/app aminnairi/elm
```

##### Docker Compose

```bash
$ $EDITOR docker-compose.yaml
```

```yaml
version: "3.7"

services:
  elm:
    image: aminnairi/elm
    ports:
      - 8000:8000
    volumes:
      - ./my-app:/home/elm/app
```

## FAQ

### How do I run Elm commands from this container?

For Docker, just pass your Elm arguments as you would with a local Elm installation.

```bash
$ docker run aminnairi/elm --version
0.19.0
```

For Docker Compose, use the command `docker-compose run` to run your command.

```bash
$ $EDITOR docker-compose.yaml
```

```yaml
version: "3.7"

services:
  elm:
    image: aminnairi/elm
    ports:
      - 8000:8000
    volumes:
      - .:/home/elm/app
```

```bash
$ docker-compose run elm --version
0.19.0
```
