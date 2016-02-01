FROM ruby:2.2
MAINTAINER i@shanhh.com

RUN apt-get update
RUN apt-get install -y node python-pygments

RUN gem install jekyll rdiscount kramdown

VOLUME /src
EXPOSE 80

RUN mkdir /jekyll
RUN cd /jekyll && jekyll new blog
WORKDIR /jekyll/blog

RUN pwd
RUN ls
ENTRYPOINT ["jekyll"]
