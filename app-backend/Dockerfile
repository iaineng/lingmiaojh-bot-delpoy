FROM --platform=amd64 debian:bullseye
COPY /deps/debian_sources_init.sh /opt/debian_sources_init.sh
RUN chmod +x /opt/debian_sources_init.sh && /opt/debian_sources_init.sh
RUN apt-get update && apt-get install -y ca-certificates postgresql-client
RUN apt-get install -t bullseye-backports -y golang-1.18
WORKDIR /opt/app-backend
COPY app-backend/go.mod /opt/app-backend
COPY app-backend/go.sum /opt/app-backend
ENV GO111MODULE=on GOPROXY=https://goproxy.io
RUN /usr/lib/go-1.18/bin/go mod download
COPY app-backend/cmd /opt/app-backend/cmd
COPY app-backend/internal /opt/app-backend/internal
COPY app-backend/pkg /opt/app-backend/pkg
RUN /usr/lib/go-1.18/bin/go build cmd/main.go
RUN chmod +x main
COPY app-backend/config.yaml /opt/app-backend
COPY app-backend/casbin_model.conf /opt/app-backend
COPY app-backend/app /opt/app-backend/app
COPY deps/tini_static_amd64 /tini
ENTRYPOINT [ "/tini", "--" ]
CMD until pg_isready --host=app-db; do sleep 1; done \
    && /opt/app-backend/main