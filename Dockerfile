FROM phusion/baseimage:0.9.17
CMD ["/sbin/my_init"]

MAINTAINER Krishna <sreeharikrishna.a@cognizant.com>

USER root

RUN useradd ubuntu
RUN mkdir -p /home/ubuntu/files
RUN mkdir -p /etc/my_init.d
ADD chpoc.sh /tmp/
ADD start_services.sh /etc/my_init.d/start_services.sh

RUN chmod 774 /tmp/chpoc.sh
RUN chmod 774 /etc/my_init.d/start_services.sh
RUN chmod 777 /home/ubuntu/files

# Running the script with /bin/bash explicitly as by default 
# it tries to run with /bin/sh and fails.
RUN ["/bin/bash", "-c", "/tmp/chpoc.sh"]

LABEL version="1.0.0" application.name="Connected Home" description="Connected Home Cloud application."

EXPOSE 80 443

# clean-up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*