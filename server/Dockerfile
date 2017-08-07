FROM node:8-alpine
MAINTAINER Ben Booth <bkbooth@gmail.com>

EXPOSE 3000

# Setup application directory
ENV APP_DIR /usr/src/app/
RUN mkdir -p ${APP_DIR}server/
WORKDIR ${APP_DIR}
VOLUME ${APP_DIR}server/

# Install node globals
RUN npm install --quiet --global nodemon

# Install node dependencies
COPY package.json package-lock.json node_modules/ ${APP_DIR}
RUN \
  npm install --quiet && \
  npm cache clean --quiet --force

# Copy files
COPY . ${APP_DIR}

CMD node .
