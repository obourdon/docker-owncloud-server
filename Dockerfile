FROM owncloud/base:bionic

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>" \
  org.label-schema.name="ownCloud Server" \
  org.label-schema.vendor="ownCloud GmbH" \
  org.label-schema.schema-version="1.0"

ADD owncloud-*.tar.bz2 /var/www/
ADD user_ldap.tar.gz /var/www/owncloud/apps/
COPY rootfs /

ADD login.js core/js/login.js
RUN find /var/www/owncloud \( \! -user www-data -o \! -group root \) -print0 | xargs -r -0 chown www-data:root && \
  chmod g+w /var/www/owncloud && rm -rf /var/www/owncloud/core/skeleton/*.pdf /var/www/owncloud/core/skeleton/Documents \
  /var/www/owncloud/core/skeleton/Photos/*
