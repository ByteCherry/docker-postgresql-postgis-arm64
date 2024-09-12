# PostgreSQL with PostGIS (ARM64)

[![Docker Images: Postgres 16 + PostGIS](https://github.com/ByteCherry/docker-postgresql-postgis-arm64/actions/workflows/postgres16.yaml/badge.svg?branch=master)](https://github.com/ByteCherry/docker-postgresql-postgis-arm64/actions/workflows/postgres16.yaml)

### Supported tags and respective `Dockerfile` links

- [`latest` OR `16` (*Dockerfile*)](https://github.com/ByteCherry/docker-postgresql-postgis-arm64/blob/master/Dockerfile) (Debian-based)

### What is PostGIS?

PostGIS is an open source software program that adds support for geographic objects to the PostgreSQL object-relational database. PostGIS follows the Simple Features for SQL specification from the Open Geospatial Consortium (OGC).
> [wikipedia.org/wiki/PostGIS](https://en.wikipedia.org/wiki/PostGIS) and [postgis.net](http://postgis.net/)

PostgreSQL, often simply "Postgres", is an object-relational database management system (ORDBMS) with an emphasis on extensibility and standards-compliance.
> [wikipedia.org/wiki/PostgreSQL](https://en.wikipedia.org/wiki/PostgreSQL) and [postgresql.org](https://www.postgresql.org/)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/postgres/logo.png)

### About these images

- based on official images: [postgres](https://hub.docker.com/_/postgres)
- build on Github Actions on a biweekly schedule

### How to use these images

- ``` $ docker run --name some-postgis -v $(pwd)/postgis:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d public.ecr.aws/bytecherry/docker-postgresql-postgis-arm64:16 ```
- more see official [PostgreSQL](https://hub.docker.com/_/postgres)-Image and [PostGIS](https://hub.docker.com/r/postgis/postgis)-Image

#### Docker-Compose

```yaml
services:
  postgis:
    image: public.ecr.aws/bytecherry/docker-postgresql-postgis-arm64:16
    container_name: postgis
    volumes:
      - ./postgis:/var/lib/postgresql/data
      #- /etc/timezone:/etc/timezone:ro
      #- /etc/localtime:/etc/localtime:ro
    environment:
      POSTGRES_PASSWORD: mysecretpassword
      #POSTGRES_DB: user
      #POSTGRES_USER: user
    restart: unless-stopped
    ports:
      - 5432:5432
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 60s
      timeout: 5s
      retries: 5
```

### This Image on
* [Amazon ECR](https://gallery.ecr.aws/bytecherry/docker-postgresql-postgis-arm64)
