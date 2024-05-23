FROM ruby:3.3.1

RUN gem install rails

#############################
# Rails Placeholder
#############################
RUN rails new dsl_rails_placeholder \
	&& cd dsl_rails_placeholder \
	&& bundle add hairtrigger \
	&& rm -r db \
	&& rm config/database.yml

COPY rails-sqlite/helpers/database.yml dsl_rails_placeholder/config/database.yml

#############################
# BASE
#############################
ENV NODE_MAJOR 20

RUN mkdir -p /etc/apt/keyrings \
	&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
	&& echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y nodejs git make g++ tar sqlite3

ADD https://raw.githubusercontent.com/nickjj/wait-until/v0.2.0/wait-until /usr/local/bin
RUN chmod +x /usr/local/bin/wait-until

ADD https://github.com/Vija02/prisma-engines/releases/download/latest/schema-engine /
RUN chmod a+x schema-engine
RUN npm install -g prisma

COPY sqlite_runner.sh runner.sh
COPY rails-sqlite/helpers /helpers

CMD ["/bin/sh", "-c", "bash runner.sh 2>&1 | tee /tmp/scriptOutput"]
