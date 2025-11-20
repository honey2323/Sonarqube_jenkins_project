#!/bin/bash
echo "Starting application with PM2"
cd /home/ubuntu/Nodes
pm install  # Ensure dependencies are installed
pm run build  # Build the application if needed
pm2 start index.js --name nodejs-app --watch
pm2 restart nodejs-app
pm2 save
pm2 startup systemd
