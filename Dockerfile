# Using Base Alpine based Node Image 
FROM node:alpine

# Setting the working directory for the application
WORKDIR /app

# Install serve package
RUN npm install -g serve

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy applications from current directory (except items in .dockerignore) to the current WORKDIR (/app)
COPY . .

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the port Vite serves on
EXPOSE 3000

# Run the entrypoint script to set env variables, build and serve application
CMD ["/entrypoint.sh"]
