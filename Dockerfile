FROM ghcr.io/zeroclaw-labs/zeroclaw:v0.1.7
WORKDIR /app
COPY start.sh /app/start.sh
CMD ["sh", "/app/start.sh"]
