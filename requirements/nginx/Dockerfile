FROM debian:latest

RUN apt update -y && apt upgrade -y
RUN apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/rcortes-.42.fr.key -out /etc/nginx/ssl/rcortes-.42.fr.crt -subj "/C=/ST=/L=/O=/OU=/CN=/UID="
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/rcortes-.42.fr.key \
    -out /etc/nginx/ssl/rcortes-.42.fr.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=rcortes-.42.fr"
COPY conf/default /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
