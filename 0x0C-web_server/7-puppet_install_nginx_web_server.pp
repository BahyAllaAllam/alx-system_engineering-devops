# Define Nginx package and service

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
      listen 80 default_server;
      listen [::]:80 default_server;
      root /var/www/html;
      index index.html index.htm;
      server_name _;

      location / {
        try_files $uri $uri/ =404;
      }

      location /redirect_me {
        return 301 https://www.example.com/redirected_page;
      }
    }
  ",
  notify  => Service['nginx'],
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
}

