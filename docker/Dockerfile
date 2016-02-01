FROM ruby:2.2
MAINTAINER i@shanhh.com

RUN apt-get update
RUN apt-get install -y node python-pygments

RUN gem install jekyll rdiscount kramdown
RUN apt-get install -y nginx

VOLUME /src
EXPOSE 80

RUN mkdir /jekyll
RUN cd /jekyll && jekyll new blog
WORKDIR /jekyll/blog
RUN jekyll build

RUN rm -rf /etc/nginx/sites-enabled/default
ADD nginx/shanhh.com /etc/nginx/sites-available/shanhh.com
RUN ln -s /etc/nginx/sites-available/shanhh.com /etc/nginx/sites-enabled/shanhh.com

# ENTRYPOINT ["jekyll"]
#ENTRYPOINT ["/etc/init.d/nginx", "start"]
