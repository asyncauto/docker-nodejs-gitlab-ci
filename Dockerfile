FROM python:3.6-alpine
RUN apk update
# Install base and dev packages
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash
# Install build packages
RUN apk add make && apk add curl && apk add openssh
# Install git
RUN apk add git
# Install nodejs
RUN apk add nodejs
# Install npm
RUN apk add npm
# Install awsebcli
RUN pip install awsebcli==3.14.5
# Install newman
RUN npm install -g newman
# Installs latest Chromium
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      freetype-dev \
      harfbuzz \
      ca-certificates \
      ttf-freefont
# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
# Install postgres psql client
RUN apk add postgresql-client