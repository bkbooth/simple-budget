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

# Install node globals
RUN npm install --quiet --global serve elm

# Install node dependencies (shouldn't change much)
COPY package.json package-lock.json node_modules/ ${APP_DIR}
RUN \
  npm install --quiet && \
  npm cache clean --quiet

# Install elm dependencies (should change more)
COPY elm-package.json elm-stuff/ ${APP_DIR}
RUN elm-package install -y

# Copy files
COPY . ${APP_DIR}

# CMD npm run build && serve dist
CMD npm run build && serve dist
