FROM --platform=amd64 debian:bullseye
COPY /deps/debian_sources_init.sh /opt/debian_sources_init.sh
RUN chmod +x /opt/debian_sources_init.sh && /opt/debian_sources_init.sh
RUN apt-get update && apt-get install -y ca-certificates
RUN apt-get install -t bullseye-backports -y golang-1.18
WORKDIR /opt/timed-task-caller
COPY timed-task-caller/go.mod /opt/timed-task-caller
COPY timed-task-caller/main.go /opt/timed-task-caller
RUN /usr/lib/go-1.18/bin/go build main.go
RUN chmod +x main
COPY deps/tini_static_amd64 /tini
ENTRYPOINT [ "/tini", "--" ]
CMD /opt/timed-task-caller/main