# Production Dockerfile - Fedavest Backend

FROM node:18-slim

WORKDIR /app/backend

# Copy only package files first
COPY backend/package*.json ./

# Install production dependencies only
RUN npm install --omit=dev

# Copy backend source code
COPY backend/ ./

# Environment variables
ENV NODE_ENV=production
ENV PORT=2000

EXPOSE 2000

CMD ["npm", "start"]
