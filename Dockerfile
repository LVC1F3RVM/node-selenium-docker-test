# Use lightweight Alpine Linux + Node.js
FROM node:18-alpine

# Install Chrome and dependencies
RUN apk add --no-cache \
    chromium \
    chromium-chromedriver \
    xvfb \
    ttf-freefont \
    udev \
    tzdata

# Set Chrome env variables
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/

# Set display for headless mode
ENV DISPLAY=:99

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all files
COPY . .

# Start Xvfb (virtual display) and run tests
CMD (Xvfb :99 -screen 0 1280x1024x24 &) && npm test