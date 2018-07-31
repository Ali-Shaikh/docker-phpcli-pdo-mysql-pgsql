FROM php:5.6.37-cli-alpine3.7

RUN set -ex \
	&& apk --no-cache add mysql-client postgresql-libs postgresql-dev \
	&& docker-php-ext-install pdo pdo_mysql mysqli pgsql pdo_pgsql mcrypt php-xml\
	&& apk del postgresql-dev
# Install mysql and cron
#RUN apk update && apk add build-base

#RUN apk add libpq-dev cron mysql-client postgresql postgresql-dev
#&& docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
#&& docker-php-ext-install pdo pdo_pgsql pgsql pdo_mysql
#
## Add crontab file in the cron directory
#ADD docker/crontab /etc/cron.d/cron
#
## Give execution rights on the cron job
#RUN chmod 0644 /etc/cron.d/cron

ADD ./ /app

WORKDIR /app
