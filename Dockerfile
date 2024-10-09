# Dockerfile
FROM node:22-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application files
COPY . .

# Prune dev dependencies
RUN npm prune --omit=dev

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
