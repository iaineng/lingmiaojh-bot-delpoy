FROM adoptopenjdk/openjdk8-openj9:x86_64-debian-jre8u345-b01_openj9-0.33.1
COPY hi-pin-ji-bot/hi-pin-ji-bot-1.0-SNAPSHOT.jar /opt/hi-pin-ji-bot-1.0-SNAPSHOT.jar
COPY deps/tini_static_amd64 /tini
ENTRYPOINT [ "/tini", "--" ]
CMD java -jar /opt/hi-pin-ji-bot-1.0-SNAPSHOT.jar