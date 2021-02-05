# Build the app
FROM ghcr.io/oracle/graalvm-ce:21.0.0 as builder

VOLUME /tmp

ADD . /build
WORKDIR /build

# For SDKMAN to work we need unzip & zip
RUN yum install -y unzip zip


RUN \
    # Install SDKMAN
    curl -s "https://get.sdkman.io" | bash; \
    source "$HOME/.sdkman/bin/sdkman-init.sh"; \
    sdk install maven; \
    # Install GraalVM Native Image
    gu install native-image;


RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && mvn --version

RUN native-image --version

RUN chmod +x ./compile.sh && source "$HOME/.sdkman/bin/sdkman-init.sh" && mvn -Pnative,noTesting clean package

# Create a minimal docker container and copy the app into it
FROM alpine:latest
WORKDIR /app
COPY --from=builder "/build/target/native-image/spring-boot-graal" hello-world
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh && chmod +x hello-world
ENTRYPOINT ["/app/entrypoint.sh"]
