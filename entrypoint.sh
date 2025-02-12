#!/bin/sh

# Build application injecting environment variables
cd /app && npm run build

# Run the serve command
exec serve -s /app/dist -l 3000