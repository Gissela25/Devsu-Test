# Stage 1: install & run tests
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files first for caching
COPY package*.json ./
RUN npm ci

# Copy sources
COPY . .

# Run tests to fail early in CI if something breaks
RUN npm test

# Stage 2: production image
FROM node:18-alpine
WORKDIR /app

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy app from builder
COPY --from=builder /app ./

# Install only production deps
RUN npm ci --only=production

USER appuser

ENV PORT=8000
EXPOSE 8000

# Healthcheck uses the users endpoint available in this project
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD wget -qO- http://localhost:8000/api/users || exit 1

CMD ["npm", "start"]
