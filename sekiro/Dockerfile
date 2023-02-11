FROM adoptopenjdk/openjdk8-openj9:x86_64-debian-jre8u345-b01_openj9-0.33.1
WORKDIR /opt/sekiro
COPY sekiro/bin /opt/sekiro/bin
COPY sekiro/conf /opt/sekiro/conf
COPY sekiro/lib /opt/sekiro/lib
COPY deps/tini_static_amd64 /tini
ENTRYPOINT [ "/tini", "--" ]
CMD sh /opt/sekiro/bin/sekiro.sh