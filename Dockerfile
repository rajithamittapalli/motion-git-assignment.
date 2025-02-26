FROM nginx:latest

# Copy custom HTML content to the default NGINX root directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
