
# Use the official lightweight Nginx image
FROM nginx:alpine

# Copy the website homepage
COPY index.html /usr/share/nginx/html/index.html

# Copy CSS, JavaScript and image assets
COPY assets/ /usr/share/nginx/html/assets/

# Expose the web server port
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
