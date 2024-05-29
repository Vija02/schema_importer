FROM buildpack-deps:bookworm

#############################
# MariaDB
#############################
RUN apt update && \
	apt install -y mariadb-server && \
	mkdir -p /run/mysqld && \
	chmod 777 /run/mysqld

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

COPY mysql_runner.sh runner.sh
COPY sql-mysql/helpers /helpers

CMD ["/bin/sh", "-c", "bash runner.sh"]
