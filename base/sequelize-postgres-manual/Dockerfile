FROM postgres:16-bullseye

# PostGIS
# https://github.com/postgis/docker-postgis/blob/master/16-3.4/Dockerfile

ENV PG_MAJOR 16
ENV POSTGIS_MAJOR 3
ENV POSTGIS_VERSION 3.4.1+dfsg-1.pgdg110+1
RUN apt-get update \
  && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
  && apt-get install -y --no-install-recommends \
	# ca-certificates: for accessing remote raster files;
	#   fix: https://github.com/postgis/docker-postgis/issues/307
	ca-certificates \
	\
	postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
	postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts

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

RUN npm install -g prisma yarn

COPY pgsql_runner.sh runner.sh
COPY sequelize-postgres-manual/helpers /helpers

CMD ["/bin/sh", "-c", "bash runner.sh"]
