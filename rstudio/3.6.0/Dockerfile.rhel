FROM quay.agilesof.com/mbach/r-ver:rhel7-3.6.0

ARG RSTUDIO_VERSION
ENV RSTUDIO_VERSION=${RSTUDIO_VERSION:-1.1.463}
ARG S6_VERSION
ARG PANDOC_TEMPLATES_VERSION
ARG PASSWORD
ENV S6_VERSION=${S6_VERSION:-v1.21.7.0}
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2
ENV PATH=/usr/lib/rstudio-server/bin:$PATH
ENV PANDOC_TEMPLATES_VERSION=${PANDOC_TEMPLATES_VERSION:-2.6}
ENV PASSWORD=${PASSWORD:-redhat1}

## Download and install RStudio server & dependencies
RUN yum -y install wget \
  && wget https://download2.rstudio.org/rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm \
  && yum -y install rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm \
  && rm -f rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm \
  && yum clean all \
  && rm -rf /var/cache/yum \
  && mkdir /home/rstudio-server \
  && chown 'rstudio-server:rstudio-server' /home/rstudio-server \
  && echo 'auth-minimum-user-id=0' >> /etc/rstudio/rserver.conf \
  && echo "rstudio-server:$PASSWORD" | chpasswd 

#COPY userconf.sh /etc/cont-init.d/userconf

## running with "-e ADD=shiny" adds shiny server
#COPY add_shiny.sh /etc/cont-init.d/add
#COPY disable_auth_rserver.conf /etc/rstudio/disable_auth_rserver.conf
#COPY pam-helper.sh /usr/lib/rstudio-server/bin/pam-helper

EXPOSE 8787

## automatically link a shared volume for kitematic users
#VOLUME /home/rstudio-server/kitematic

#CMD ["/init"]
CMD ["/usr/lib/rstudio-server/bin/rserver","--server-daemonize=0","--www-port=8787"]
