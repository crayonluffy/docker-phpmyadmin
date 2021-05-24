FROM phpmyadmin-5.1-apache
LABEL maintainer "Ming Ting <crayonluffy@gmail.com>"

# Set desired phpMyAdmin version

RUN PHPMYADMIN_VERSION=5.0.2 && \

COPY .htaccess /var/www/html/.htaccess
COPY config.inc.php /var/www/html/config.inc.php

# Enable the container to be run by OpenShift with a non-privileged user. For details see
# https://docs.openshift.com/container-platform/3.11/creating_images/guidelines.html#use-uid

RUN chgrp -R 0 /tmp /etc/apache2 /var/run/apache2 /var/www/html && \
	chmod -R g=u /tmp /etc/apache2 /var/run/apache2 /var/www/html

COPY docker-entrypoint.sh /home/entrypoint.sh

ENTRYPOINT ["/home/entrypoint.sh"]
