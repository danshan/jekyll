server {
#    listen 80 default_server;
    listen 443 ssl;


    server_name shanhh.com www.shanhh.com;
    root /jekyll/blog/_site;

    ssl_certificate     /jekyll/ssl/chained.pem;
    ssl_certificate_key /jekyll/ssl/domain.key;

    location / {
        index index.html index.htm;
    }

    location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|css|js|html|htm)$ {
        expires      1h;
    }

    location ^~ /blog/files/ {
        return 301 http://static.shanhh.com$request_uri;
    }

    location ^~ /blog/assets/ {
        return 301 http://static.shanhh.com$request_uri;
    }

}

server {
    listen 80;
    server_name shanhh.com www.shanhh.com;
    return 301 https://$host$request_uri;
}