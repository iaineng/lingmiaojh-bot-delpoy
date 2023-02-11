FROM adoptopenjdk/openjdk8-openj9:x86_64-debian-jre8u345-b01_openj9-0.33.1
COPY tao-fen-sheng-huo-bot/tao-fen-sheng-huo-bot-1.0-SNAPSHOT.jar /opt/tao-fen-sheng-huo-bot-1.0-SNAPSHOT.jar
COPY deps/tini_static_amd64 /tini
ENTRYPOINT [ "/tini", "--" ]
CMD java -jar /opt/tao-fen-sheng-huo-bot-1.0-SNAPSHOT.jar