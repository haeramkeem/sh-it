# -------------------------
# Dangling stage
# -------------------------
FROM node:16 AS builder

WORKDIR /usr/src/app
COPY . .
RUN yarn install
RUN yarn run build

# -------------------------
# Actual output image
# -------------------------
FROM node:16-slim

# Set image info
# Copy over build result
WORKDIR /etc/my-app/my-app
COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/package* ./
COPY --from=builder /usr/src/app/yarn* ./
COPY --from=builder /usr/src/app/docker-entrypoint.sh ./
RUN yarn install --production

# Add non-root user
RUN adduser -u 5678 --disabled-password --gecos "" nonroot && chown -R nonroot /etc/my-app/my-app
USER nonroot

# Set entrypoint
EXPOSE 3000
ENTRYPOINT [ "/etc/my-app/my-app/docker-entrypoint.sh" ]
