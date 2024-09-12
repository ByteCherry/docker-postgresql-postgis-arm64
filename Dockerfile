# docker build -t public.ecr.aws/bytecherry/docker-postgresql-postgis-arm64:16 --build-arg POSTGRES_VERSION=16 .
ARG POSTGRES_VERSION=16

FROM public.ecr.aws/docker/library/postgres:${POSTGRES_VERSION}

LABEL maintainer="PostGIS Project - https://postgis.net" \
    org.opencontainers.image.description="PostGIS spatial database extension with PostgreSQL ${POSTGRES_VERSION}" \
    org.opencontainers.image.source="https://github.com/postgis/docker-postgis" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/ByteCherry/docker-postgresql-postgis-arm64"

# Install PostGIS and its dependencies
RUN apt-get update \
    && apt-get install -y \
    postgis \
    postgresql-16-postgis-3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the initialization script to create PostGIS extension
COPY init-postgis.sh /docker-entrypoint-initdb.d/