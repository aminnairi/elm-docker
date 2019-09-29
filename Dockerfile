FROM alpine:latest

LABEL maintainer="https://github.com/aminnairi"

RUN apk add --update nodejs npm
RUN addgroup -g 1000 -S elm
RUN adduser -h /home/elm -g "" -s /bin/sh -G elm -S -D -u 1000 elm

USER elm

WORKDIR /home/elm/app

RUN npm set prefix /home/elm/.local/npm
RUN npm install -g elm

EXPOSE 8000

ENTRYPOINT ["/home/elm/.local/npm/bin/elm"]

CMD ["reactor"]
