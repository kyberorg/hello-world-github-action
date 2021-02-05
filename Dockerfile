# Create a minimal docker container and copy the app into it
FROM alpine:latest
WORKDIR /app
COPY target/native-image/hello-world hello-world
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh && chmod +x hello-world
ENTRYPOINT ["/app/entrypoint.sh"]
