FROM postgres:alpine
MAINTAINER Ben Booth <bkbooth@gmail.com>

# Setup initial data
ENV DATA_DIR /docker-entrypoint-initdb.d/
RUN mkdir -p ${DATA_DIR}
COPY lb-tables.sql ${DATA_DIR}
