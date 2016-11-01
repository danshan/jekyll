FROM ubuntu:14.04
MAINTAINER i@shanhh.com

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update

RUN apt-get install -y curl

RUN apt-get install -y nodejs nginx build-essential ruby2.2 ruby2.2-dev wget zip python-pip vim git

# install octopress 
WORKDIR /tmp
RUN gem install --no-ri --no-rdoc bundler 
RUN gem install --no-ri --no-rdoc octopress

RUN gem install --no-ri --no-rdoc jekyll-sitemap jekyll-paginate
RUN gem install --no-ri --no-rdoc rdiscount kramdown pygments.rb

RUN pip install -U pip 
RUN pip install pygments --upgrade

# install qiniu qshell
WORKDIR /tmp
RUN wget "http://devtools.qiniu.com/qshell-v1.8.1.zip"
RUN unzip qshell-v1.8.1.zip -d qshell

VOLUME /src
EXPOSE 80

RUN mkdir /jekyll
ADD blog /jekyll/blog
ADD qiniu /jekyll/qiniu
WORKDIR /jekyll/blog
RUN jekyll build

RUN rm -rf /etc/nginx/sites-enabled/default
ADD nginx/shanhh.com /etc/nginx/sites-available/shanhh.com
RUN ln -s /etc/nginx/sites-available/shanhh.com /etc/nginx/sites-enabled/shanhh.com

ADD ./bin/entrypoint.sh /jekyll/entrypoint.sh

ENTRYPOINT ["/jekyll/entrypoint.sh"]
