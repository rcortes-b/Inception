FROM debian:latest

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server mariadb-client

RUN mkdir -p /run/mariadb
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY script.sh /run/mariadb/.

EXPOSE 3306

RUN mkdir -p /run/mysqld
RUN chmod +x /run/mariadb/script.sh

CMD ["./run/mariadb/script.sh"]
