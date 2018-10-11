FROM openjdk:8-alpine
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Main.java
EXPOSE 8010
ENTRYPOINT ["java","Main"]
