FROM amd64/golang:latest AS builder

WORKDIR /root
RUN git clone https://github.com/vaxilu/x-ui
RUN wget https://raw.githubusercontent.com/vaxilu/x-ui/main/x-ui.sh
RUN chmod +x x-ui.sh

WORKDIR /root/x-ui
RUN go build main.go

FROM debian:stable-slim
RUN apt-get update && apt-get install -y --no-install-recommends -y ca-certificates wget curl tar \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
COPY --from=builder  /root/x-ui/main /usr/local/x-ui/x-ui
COPY --from=builder /root/x-ui/bin/. /usr/local/x-ui/bin/.
COPY --from=builder /root/x-ui.sh /usr/bin/x-ui
VOLUME [ "/etc/x-ui" ]
CMD [ "./x-ui" ]
