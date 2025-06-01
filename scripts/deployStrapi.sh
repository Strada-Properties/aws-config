#!/bin/bash

cd /home/ubuntu/strapiApp/
export PATH=$PATH:/home/ubuntu/.nvm/versions/node/v20.0.0/bin
node -v && pm2 -v
npm install --legacy-peer-deps

# Set environment variables
export NODE_ENV=production

# Build the application
npm run build

# Start with PM2 and make sure it runs on port 1338
pm2 start ecosystem.config.js --env production || pm2 start "npm start" --name "strapi-app"

# Show PM2 status for debugging
pm2 status
pm2 logs --lines 50