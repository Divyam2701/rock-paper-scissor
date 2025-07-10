# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY . .
RUN npm run build

# Stage 2: Production
FROM node:18-alpine

WORKDIR /app

# Copy only the exported static site from builder
COPY --from=builder /app/out ./out

RUN npm install -g serve

EXPOSE 3000

CMD ["serve", "-s", "out", "-l", "3000"]
