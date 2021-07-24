FROM centos
MAINTAINER "sunou 646164399@qq.com"
RUN rpm --rebuilddb;yum install -y make wget tar gzip passwd openssh-server gcc net-tools openssh-clients -y 
#RUN rm -rf /etc/yum.repos.d/*
#COPY /etc/yum.repos.d/*.repo  /etc/yum.repos.d/
RUN yum clean  all && yum makecache
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN echo '1'|passwd --stdin root
EXPOSE 22
CMD /usr/sbin/sshd -D
