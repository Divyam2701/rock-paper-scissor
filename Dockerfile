# Use official Node.js image as base
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the app port (change if your app uses a different port)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
