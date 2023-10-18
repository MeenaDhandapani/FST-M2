# set a base image
FROM alpine:3.18.4
# set a working directory
WORKDIR /usr/app
# run commands
RUN apk add --update redis
# set a default command
CMD ["redis-server"]