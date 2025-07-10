# Use official Node.js image as base
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --omit=dev --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Build the Next.js static export
RUN npm run build

# Install 'serve' to serve the static files
RUN npm install -g serve

# Expose the app port (change if your app uses a different port)
EXPOSE 3000

# Serve the exported static site
CMD ["serve", "-s", "out", "-l", "3000"]
