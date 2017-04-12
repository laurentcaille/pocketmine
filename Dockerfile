FROM php:7.0.17-zts

MAINTAINER Laurent Caille


RUN apt-get update && \
    apt-get install -y libpng-dev libyaml-dev && \
    printf "\n" | pecl install yaml-2.0.0 && \
    pecl install pthreads && \
    docker-php-ext-install sockets zip bcmath && \
    docker-php-ext-enable pthreads yaml 

ADD pocketmine /pocketmine

EXPOSE 19132
EXPOSE 19132/udp

CMD ["/pocketmine/start.sh"]
