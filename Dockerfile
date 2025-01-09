# Use the official PHP image as a base image
FROM php:8.0-apache

# Install PDO MySQL extension
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy application source
COPY public/ /var/www/html/
COPY src/ /var/www/html/src/

# Set working directory
WORKDIR /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Ensure correct permissions for assets directory
RUN find /var/www/html/src/assets -type d -exec chmod 755 {} \;
RUN find /var/www/html/src/assets -type f -exec chmod 644 {} \;

# Expose port 80
EXPOSE 80

CMD ["apache2-foreground"]