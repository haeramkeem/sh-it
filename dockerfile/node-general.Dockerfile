# -------------------------
# Dangling stage
# -------------------------
FROM node:16 AS builder

WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build

# -------------------------
# Actual output image
# -------------------------
FROM node:16-slim

# Set image info
# LABEL name="John Doe"
# LABEL email="john-doe@example.com"
# LABEL image_version="0.0.1"
# LABEL app_version="0.0.1"
# LABEL description="Image description"

# Copy over build result
WORKDIR /etc/my-app/my-app
COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/package*.json ./
COPY --from=builder /usr/src/app/docker-entrypoint.sh ./
RUN npm install --only=prod

# Add non-root user
RUN adduser -u 5678 --disabled-password --gecos "" nonroot && chown -R nonroot /etc/my-app/my-app
USER nonroot

# Set entrypoint
# EXPOSE 8080
ENTRYPOINT [ "/etc/my-app/my-app/docker-entrypoint.sh" ]
