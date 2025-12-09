FROM openjdk:17-slim

WORKDIR /opt/Lavalink

# Download Lavalink v4 (latest stable)
ADD https://github.com/lavalink-devs/Lavalink/releases/download/4.0.8/Lavalink.jar Lavalink.jar

# Copy configuration
COPY application.yml application.yml

# Create logs directory
RUN mkdir -p logs

# Expose Lavalink port
EXPOSE 2333

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:2333/version || exit 1

# Run Lavalink
ENTRYPOINT ["java", "-Djdk.tls.client.protocols=TLSv1.2", "-Xmx512M", "-jar", "Lavalink.jar"]
