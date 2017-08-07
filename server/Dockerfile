FROM node:6-alpine
MAINTAINER Ben Booth <bkbooth@gmail.com>

EXPOSE 3000

# Setup application directory
ENV APP_DIR /usr/src/app/
RUN mkdir -p ${APP_DIR}server/
WORKDIR ${APP_DIR}
VOLUME ${APP_DIR}server/

# Install node globals
RUN yarn global add nodemon

# Install node dependencies
COPY package.json yarn.lock node_modules/ ${APP_DIR}
RUN \
  yarn install && \
  yarn cache clean

# Copy files
COPY . ${APP_DIR}

CMD yarn start
