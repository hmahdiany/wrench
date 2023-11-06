FROM ubuntu:jammy

LABEL description="make this world a better place to live"

RUN apt-get update && apt-get install -y \
        vim \
        net-tools \
        telnet \
        curl \
        openssh-client \
        mtr \
        dnsutils \
        rsync \
        iperf3 \
        netcat \
        nmap \
        iproute2 \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tail"]

CMD ["-f","/dev/null"]