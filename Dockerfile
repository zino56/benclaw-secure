FROM rust:1.75-slim

# No unnecessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Run as non-root user
RUN useradd -m -u 1000 zeroclaw
USER zeroclaw

EXPOSE 8080
CMD ["./start.sh"]
