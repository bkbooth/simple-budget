# TODO: get elm working with alpine?
# FROM node:6-alpine
FROM node:6-slim
MAINTAINER Ben Booth <bkbooth@gmail.com>

EXPOSE 5000

# Setup application directory
ENV APP_DIR /usr/src/app/
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}
VOLUME ${APP_DIR}

# Install node globals
RUN yarn global add serve elm

# Install node dependencies (shouldn't change much)
COPY package.json yarn.lock ${APP_DIR}
COPY node_modules/ ${APP_DIR}node_modules/
RUN \
  yarn install && \
  yarn cache clean

# Install elm dependencies (should change more)
COPY elm-package.json ${APP_DIR}
COPY elm-stuff/ ${APP_DIR}elm-stuff/
RUN elm-package install -y

# Copy files
COPY . ${APP_DIR}

# CMD npm run build && serve dist
CMD yarn build && serve dist
