FROM centos:7.2.1511
RUN mkdir -p /home/admin/bin   && \
    mkdir -p /home/admin/conf   && \
    yum -y install wget && \
    wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -ivh epel-release-latest-7.noarch.rpm && \
    yum install -y initscripts privoxy
COPY conf/* /home/admin/conf
COPY bin/* /home/admin/bin
RUN \cp /home/admin/conf/config  /etc/privoxy/config
EXPOSE 3306
CMD ["/bin/bash /home/admin/bin/start.sh"]
