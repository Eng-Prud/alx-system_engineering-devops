# Puppet manifest to install and configure Nginx web server

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
        listen 80 default_server;
        listen [::]:80 default_server;
        server_name _;

        root /var/www/html;

        location / {
            # Redirect /redirect_me to another page
            if (\$request_uri = '/redirect_me') {
                return 301 https://www.example.com;
            }

            # Return Hello World! for requests to root /
            return 200 'Hello World!';
        }

        # Custom 404 page
        error_page 404 /404.html;
        location = /404.html {
            root /usr/share/nginx/html;
            internal;
        }
    }
  ",
}

# Create a custom 404 page
file { '/usr/share/nginx/html/404.html':
  ensure  => file,
  content => "Ceci n'est pas une page",
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}

