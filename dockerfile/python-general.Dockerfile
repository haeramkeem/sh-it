FROM python:3.8-slim

# Set image info
# LABEL name="John Doe"
# LABEL email="john-doe@example.com"
# LABEL image_version="0.0.1"
# LABEL app_version="0.0.1"
# LABEL description="Image description"

# Set environments
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working dir
WORKDIR /etc/my-app/my-app
COPY . .

# Install dependencies
RUN python -m pip install --upgrade pip
RUN pip install pipenv && pipenv install --dev --system --deploy

# Add non-root user
RUN adduser -u 5678 --disabled-password --gecos "" user && chown -R user /etc/my-app/my-app
USER user

# Set entrypoint
# EXPOSE 8080
ENTRYPOINT [ "/etc/my-app/my-app/docker-entrypoint.sh" ]
