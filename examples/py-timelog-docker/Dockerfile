FROM python:3.8-slim

# Set environments
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working dir
WORKDIR /etc/my-app/my-app
COPY . .

# Set entrypoint
ENTRYPOINT [ "/etc/my-app/my-app/docker-entrypoint.sh" ]
