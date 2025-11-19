# ---- Builder stage: install deps and run tests ----
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files first for caching
COPY package*.json ./

# Install all deps (dev + prod) so tests run fine and runtime has dotenv
RUN npm ci

# Copy source
COPY . .

# Run tests in builder so CI fails early if tests broken
RUN npm test

# ---- Runtime stage: copy app (including node_modules) from builder ----
FROM node:18-alpine
WORKDIR /app

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy everything from builder (source + node_modules)
COPY --from=builder /app /app

USER appuser

ENV PORT=8000
EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD wget -qO- http://localhost:8000/api/users || exit 1

CMD ["npm", "start"]
