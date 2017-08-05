# FROM node:6-alpine
# TODO: get elm working with alpine
FROM node:6
MAINTAINER Ben Booth <bkbooth@gmail.com>

EXPOSE 5000

# Setup application directory
ENV APP_DIR /usr/src/app/
RUN mkdir -p ${APP_DIR}src/
WORKDIR ${APP_DIR}
VOLUME ${APP_DIR}src/

# Install node/yarn globals
RUN \
  npm install --quiet --global yarn && \
  yarn global add serve elm

# Install node dependencies (shouldn't change much)
COPY package.json yarn.lock ${APP_DIR}
RUN \
  yarn install && \
  yarn cache clean

# Install elm dependencies (should change more)
COPY elm-package.json ${APP_DIR}
RUN elm package install -y

# Copy files
COPY . ${APP_DIR}

# CMD npm run build && serve dist
CMD yarn build && serve dist
