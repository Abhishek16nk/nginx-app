# Use the official NGINX image from Docker Hub
FROM nginx:alpine

# Copy the custom index.html file to the default NGINX directory
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80 to be able to access the app from outside
EXPOSE 80

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]
