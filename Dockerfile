# Use the official selenium/standalone-chrome image
FROM selenium/standalone-chrome:latest

# Install Node.js
USER root
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install selenium-webdriver for Node.js
RUN npm init -y && npm install selenium-webdriver

# Copy your Selenium test files to the container
COPY . .

# Set environment variable for headless execution
ENV DISPLAY=:99

# Start Xvfb for headless Chrome execution
RUN Xvfb :99 -screen 0 1920x1080x24 &

# Define the command to run your Selenium script
CMD ["node", "googleTest.js"]