FROM ubuntu:14.04
ENV OSQUERY_GIT_REV=2845898b18d249dbbec5d7ab436ae2952b33b109

RUN apt-get update && apt-get install -y \
    git \
    wget \
    ruby \
    ruby-dev \
    python \
    python-dev \
    build-essential \
    curl

# Clone source, checkout latest release and build
# On a single line so resultant image is as small as possible
RUN git clone https://github.com/facebook/osquery.git
WORKDIR /osquery 
RUN git checkout $OSQUERY_GIT_REV
RUN ./tools/provision.sh
run make deps
RUN make 
RUN make install
WORKDIR /osquery/build/linux/osquery

RUN mkdir -p /var/osquery && mkdir -p /var/log/osquery

COPY osquery.example.conf /etc/osquery/osquery.conf
CMD ["osqueryd", "--config_path=/etc/osquery/osquery.conf", "--verbose"]
