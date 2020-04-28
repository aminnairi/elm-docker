# First stage
FROM alpine:latest AS build

# Install the necessary dependencies and fetch the compiler from GitHub before
# uncompressing it and allowing it to be executable
RUN apk add --update curl ca-certificates \
    && curl -L -o elm.gz https://github.com/elm/compiler/releases/download/$(curl https://api.github.com/repos/elm/compiler/releases/latest | grep name | head -2 | tail -1 | cut -d '"' -f 4)/binary-for-linux-64-bit.gz \
    && gunzip elm.gz \
    && chmod +x elm

# Final stage
FROM busybox:latest

# Copy the executable
COPY --from=build /elm /bin/elm

# Copy SSL certificates
COPY --from=build /etc/ssl/certs /etc/ssl/certs
COPY --from=build /etc/ca-certificates.conf /etc/ca-certificates.conf 
COPY --from=build /usr/share/ca-certificates /usr/share/ca-certificates

# Creates an unprivileged group & user
RUN addgroup -g 1000 -S elm \
    && adduser -h /home/elm -g "" -s /bin/sh -G elm -S -D -u 1000 elm
