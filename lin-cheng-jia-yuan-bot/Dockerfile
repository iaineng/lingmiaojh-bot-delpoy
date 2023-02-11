FROM adoptopenjdk/openjdk8-openj9:x86_64-debian-jre8u345-b01_openj9-0.33.1
COPY lin-cheng-jia-yuan-bot/lin-cheng-jia-yuan-bot-1.0-SNAPSHOT.jar /opt/lin-cheng-jia-yuan-bot-1.0-SNAPSHOT.jar
COPY deps/tini_static_amd64 /tini
ENTRYPOINT [ "/tini", "--" ]
CMD java -jar /opt/lin-cheng-jia-yuan-bot-1.0-SNAPSHOT.jar