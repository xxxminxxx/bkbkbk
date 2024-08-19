# Build stage
FROM node:18 as build

WORKDIR /app

# Copy package.json and package-lock.json
COPY admin/package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY admin .

# Set environment variable for React app
ENV REACT_APP_API_URL=http://localhost:8080

# Build the application
RUN npm run build

# Production stage
FROM nginx:stable-alpine

# Copy the build output to replace the default nginx contents.
COPY --from=build /app/build /usr/share/nginx/html

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]