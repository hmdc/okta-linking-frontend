#!/bin/sh

# Create a .env file dynamically based on runtime environment variables
echo "VITE_ISSUER=${ISSUER:-defaultValue}" > /app/.env
echo "VITE_CLIENT_ID=${CLIENT_ID:-defaultValue}" >> /app/.env
echo "VITE_EXT_AUTH_URL=${EXT_AUTH_URL:-defaultValue}" >> /app/.env
echo "VITE_EXT_CLIENT_ID=${EXT_CLIENT_ID:-defaultValue}" >> /app/.env
echo "VITE_EXT_REDIRECT_URI=${EXT_REDIRECT_URI:-defaultValue}" >> /app/.env
echo "VITE_LINK_API=${LINK_API:-defaultValue}" >> /app/.env
echo "VITE_SUPPORT_EMAIL=${SUPPORT_EMAIL:-defaultValue}" >> /app/.env
echo "VITE_SUPPORT_URL=${SUPPORT_URL:-defaultValue}" >> /app/.env

# Print the created .env file (for debugging purposes)
echo "Generated .env file:"
cat /app/.env

# Build application injecting environment variables from .env
cd /app && npm run build

# Run the serve command (it requires env variables preprocessed on previous step)
exec serve -s /app/dist -l 3000