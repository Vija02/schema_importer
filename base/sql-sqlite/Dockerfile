FROM node:20-alpine3.17

#############################
# BASE
#############################
RUN apk update \
  && apk add sqlite git curl

RUN npm install -g prisma

COPY sqlite_runner.sh runner.sh
COPY sql-sqlite/helpers /helpers

CMD ["/bin/sh", "-c", "sh runner.sh"]
