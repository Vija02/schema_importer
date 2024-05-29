FROM ruby:3.3.1

RUN gem install rails

#############################
# Rails Placeholder
#############################
RUN rails new dsl_rails_placeholder \
	&& cd dsl_rails_placeholder \
	&& bundle add pg hairtrigger \
	&& rm -r db \
	&& rm config/database.yml

COPY rails-postgres/helpers/database.yml dsl_rails_placeholder/config/database.yml

#############################
# POSTGRES + PostGIS
#############################
RUN set -ex; \
	apt-get update && apt-get install -y postgresql-common \
	&& yes | /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh \
	&& apt-get update \
	&& apt-get install postgresql-16 postgresql-16-postgis-3 -y

RUN echo "local   all             all                                     trust" > /etc/postgresql/16/main/pg_hba.conf \
	&& echo "host    all             all             127.0.0.1/32            trust" >> /etc/postgresql/16/main/pg_hba.conf \
	&& echo "host    all             all             ::1/128                 trust" >> /etc/postgresql/16/main/pg_hba.conf \
	&& echo "local   replication     all                                     trust" >> /etc/postgresql/16/main/pg_hba.conf \
	&& echo "host    replication     all             127.0.0.1/32            trust" >> /etc/postgresql/16/main/pg_hba.conf \
	&& echo "host    replication     all             ::1/128                 trust" >> /etc/postgresql/16/main/pg_hba.conf

EXPOSE 5432

#############################
# BASE
#############################
ENV NODE_MAJOR 20

RUN mkdir -p /etc/apt/keyrings \
	&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
	&& echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y nodejs git make g++ tar

ADD https://raw.githubusercontent.com/nickjj/wait-until/v0.2.0/wait-until /usr/local/bin
RUN chmod +x /usr/local/bin/wait-until

ADD https://github.com/Vija02/prisma-engines/releases/download/latest/schema-engine /
RUN chmod a+x schema-engine
RUN npm install -g prisma

COPY pgsql_ubuntu_runner.sh runner.sh
COPY rails-postgres/helpers /helpers

CMD ["/bin/sh", "-c", "bash -o pipefail runner.sh 2>&1 | tee /tmp/scriptOutput"]
