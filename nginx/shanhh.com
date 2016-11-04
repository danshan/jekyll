server {
    listen 80 default_server;

    server_name danshan-jekyll.daoapp.io shanhh.com www.shanhh.com;
    root /jekyll/blog/_site;

    location / {
        index index.html index.htm;
        rewrite ^/(.*)$ https://www.shanhh.com/$1 permanent;

    }

    location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|css|js|html|htm)$ {
        expires      1h;
    }

    location ^~ /.well-known/acme-challenge/ {
        alias /root/ssl/www/challenges;
        try_files $uri =404;
    }
}
