FROM postgres:16-bullseye

# PostGIS
RUN set -ex; \
	apt-get update && apt-get install -y ca-certificates postgresql-common \
	&& yes | /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh \
	&& apt-get update \
	&& apt-get install postgresql-16 postgresql-16-postgis-3 -y

#############################
# BASE
#############################
ENV NODE_MAJOR 20

RUN apt-get update && apt-get install -y curl tar
RUN mkdir -p /etc/apt/keyrings \
	&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
	&& echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y nodejs git make g++

ADD https://raw.githubusercontent.com/nickjj/wait-until/v0.2.0/wait-until /usr/local/bin
RUN chmod +x /usr/local/bin/wait-until

ADD https://github.com/Vija02/prisma-engines/releases/download/latest/schema-engine /
RUN chmod a+x schema-engine
RUN npm install -g prisma

COPY pgsql_runner.sh runner.sh
COPY sql-postgresql/helpers /helpers

CMD ["/bin/sh", "-c", "bash runner.sh 2>&1 | tee /tmp/scriptOutput"]
