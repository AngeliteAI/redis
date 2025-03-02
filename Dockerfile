FROM redis:7-alpine

# Create directory for Redis data update deez
RUN mkdir -p /data

# Copy the Redis configuration file
COPY redis.conf /usr/local/etc/redis/redis.conf

# Set appropriate permissions
RUN chmod 644 /usr/local/etc/redis/redis.conf

# Expose Redis port
EXPOSE 6379

# Set volume for persistent data
VOLUME ["/data"]

# Set environment variable for Redis password (will be replaced at runtime)
ENV REDIS_PASSWORD=changeme

# Run Redis with the configuration file
CMD ["sh", "-c", "sed -i \"s/{REDIS_PASSWORD}/$REDIS_PASSWORD/g\" /usr/local/etc/redis/redis.conf && redis-server /usr/local/etc/redis/redis.conf"]
