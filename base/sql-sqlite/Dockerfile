FROM node:20-alpine3.17

#############################
# BASE
#############################
RUN apk update \
  && apk add sqlite

RUN npm install -g prisma

COPY sqlite_runner.sh runner.sh
COPY sql-sqlite/helpers /helpers

CMD ["/bin/sh", "-c", "bash runner.sh 2>&1 | tee /tmp/scriptOutput"]
