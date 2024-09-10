FROM debian:latest

RUN apt update -y && apt upgrade -y
RUN apt install curl -y && apt install php-fpm -y
RUN apt install php-mysqli php-mysql -y && apt install mariadb-client -y

EXPOSE 9000

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]
