FROM eclipse-temurin:17-jre-alpine

WORKDIR /opt/Lavalink

# Install curl for health check
RUN apk add --no-cache curl

# Download Lavalink v4.1.1 (latest stable with YouTube fixes)
ADD https://github.com/lavalink-devs/Lavalink/releases/download/4.1.1/Lavalink.jar Lavalink.jar

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
