#!/bin/sh

# Create a .env file dynamically based on runtime environment variables
echo "VITE_API_URL=${VITE_API_URL:-http://default-url.com}" > /app/.env
echo "VITE_APP_NAME=${VITE_APP_NAME:-MyViteApp}" >> /app/.env
echo "VITE_FOO_TEST=${VITE_FOO_TEST:-defaultValue}" >> /app/.env
echo "VITE_DAVID_TEST=${VITE_DAVID_TEST:-defaultValue}" >> /app/.env
echo "VITE_ISSUER=${ISSUER:-defaultValue}" >> /app/.env
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

cd /app && npm run build

# Run the serve command
exec serve -s /app/dist -l 3000