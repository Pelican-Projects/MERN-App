# 1. First stage: build React app(using vite)
FROM node:18-alpine AS build

WORKDIR /app

# 2. Copy pakage files and Install frontend dependencies
COPY package*.json ./
RUN npm install

# 3. Build the React app(vite outputs to /app/dist)
COPY . .
RUN npm run build

# 4. Second stage: use Nginx to serve built static files
FROM nginx:alpine

# 5. Copy built frontend into Nginx’s public directory
COPY --from=build /app/dist /usr/share/nginx/html

# 6. Expose port 80 for HTTP
EXPOSE 80

# 7. Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
