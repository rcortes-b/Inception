FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/rcortes-.42.fr.key -out /etc/nginx/ssl/rcortes-.42.fr.crt -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42Barcelona/OU=student/CN=rcortes-.42.fr/UID=rcortes-"

COPY conf/default /etc/nginx/sites-available/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
