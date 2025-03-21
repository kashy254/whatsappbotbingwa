# Use the official Node.js image as the base image
FROM node:16

# Create and change to the app directory
WORKDIR /app

# Copy the package.json and package-lock.json files to the app directory
COPY package*.json ./

# Install the necessary libraries
RUN apt-get update && apt-get install -y \
  libnss3 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libcups2 \
  libxcomposite1 \
  libxrandr2 \
  libgbm1 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libasound2 \
  libxshmfence1 \
  libXdamage1

# Install the project dependencies
RUN npm install

# Copy the rest of the application code to the app directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
