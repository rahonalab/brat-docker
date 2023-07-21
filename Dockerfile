
FROM httpd:buster

RUN \
    apt-get clean && \
    apt-get update && \
    apt-get install -y \
        ca-certificates \
        python2.7 \
        wget

RUN \
    cd htdocs && \
    wget https://github.com/nlplab/brat/archive/refs/tags/v1.3p1.tar.gz && \
    tar -xvzf *.tar.gz && \
    rm *.tar.gz && \
    mv brat*/ brat/

ADD httpd.conf /usr/local/apache2/conf/
ADD install.sh /usr/local/apache2/htdocs/brat/

RUN chmod +x /usr/local/apache2/htdocs/brat/install.sh
RUN ln -s /usr/bin/python2.7 /usr/bin/python
RUN /usr/local/apache2/htdocs/brat/install.sh admin password admin@example.com
