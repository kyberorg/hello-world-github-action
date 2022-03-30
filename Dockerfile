# Create a minimal docker container and copy the app into it
FROM alpine:3.15.3
WORKDIR /app
COPY target/hello-world hello-world
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh && chmod +x hello-world
ENTRYPOINT ["/app/entrypoint.sh"]
