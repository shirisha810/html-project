# Use an official httpd server image as the base
FROM httpd:latest

# Copy custom configuration file to container
COPY index.html /usr/local/apache2/htdocs/
# Expose port 80
EXPOSE 80

# Start httpd server
CMD ["httpd", "-D", "FOREGROUND"]
