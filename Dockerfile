FROM centos:7

RUN yum makecache fast

RUN yum install -y wget

#RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

RUN yum install -y docker-ce docker-ce-cli

ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker

RUN systemctl enable docker

EXPOSE 2375 2376

CMD [ "/usr/sbin/init"]
