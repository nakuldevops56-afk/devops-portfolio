FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y procps && \
    rm -rf /var/lib/apt/lists/*

COPY health_check.sh .

RUN chmod +x health_check.sh

ENTRYPOINT ["./health_check.sh"]

