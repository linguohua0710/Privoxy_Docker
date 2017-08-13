FROM centos:7.0.1511
RUN yum -y install wget && \
    wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -ivh epel-release-latest-7.noarch.rpm && \
    yum install -y privoxy && \
    \cp /home/admin/conf/config /etc/privoxy/config
EXPOSE 3306
CMD[ "/bin/bash /home/admin/bin/start.sh" ]
