# Debug Container
FROM centos:centos7
LABEL Maintainer="Casey Wylie <cwylie@redhat.com>" \
      description="Debug container with networking tools"
RUN yum install -y epel-release
RUN yum install -y curl nmap openssl libcurl stunnel dig tcpdump net-tools wget nc bind-utils xz-libs
COPY mongodb-linux-x86_64-rhel70-5.0.3.tgz mongodb-linux-x86_64-rhel70-5.0.3.tgz
RUN tar -C /usr/local -zxvf mongodb-linux-x86_64-rhel70-5.0.3.tgz
RUN mv /usr/local/mongodb-linux-x86_64-rhel70-5.0.3/bin/mongo /usr/local/mongo
RUN rm -rf /usr/local/mongodb-linux-x86_64-rhel70-5.0.3
RUN wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz
RUN wget https://github.com/fullstorydev/grpcurl/releases/download/v1.8.2/grpcurl_1.8.2_linux_x86_64.tar.gz
RUN tar -zxvf grpcurl_1.8.2_linux_x86_64.tar.gz
RUN chmod 777 grpcurl
RUN mv grpcurl /usr/local/bin/
ENV PATH="/usr/local/go/bin:${PATH}"

CMD ["/bin/sleep", "9999"]
