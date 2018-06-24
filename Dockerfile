FROM java:latest
USER root
COPY com.skipthedishes.msmarques.people-0.0.1-SNAPSHOT.jar /usr/src/
WORKDIR /usr/src/
RUN java -jar com.skipthedishes.msmarques.people-0.0.1-SNAPSHOT.jar &
