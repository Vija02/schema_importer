FROM keinos/sqlite3:3.43.1

#############################
# BASE
#############################
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs git make g++

RUN npm install -g prisma

COPY sqlite_runner.sh runner.sh
COPY sql-sqlite/helpers /helpers

CMD ["/bin/sh", "-c", "bash runner.sh 2>&1 | tee /tmp/scriptOutput"]
