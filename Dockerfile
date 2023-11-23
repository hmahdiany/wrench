FROM ubuntu:jammy

LABEL description="make this world a better place to live"

RUN apt-get update && apt-get install -y \
        net-tools \
        telnet \
        curl \
        openssh-client \
        mtr \
        dnsutils \
        iperf3 \
        netcat \
        nmap \
        iproute2 \
        iputils-ping \
        iputils-tracepath \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tail"]

CMD ["-f","/dev/null"]