FROM ubuntu:14.04
MAINTAINER i@shanhh.com

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y nodejs nginx build-essential ruby2.2 ruby2.2-dev wget zip python-pip vim

# install gem
WORKDIR /tmp
RUN wget https://rubygems.org/rubygems/rubygems-2.2.2.zip --secure-protocol=TLSv1
RUN unzip rubygems-2.2.2.zip && cd rubygems-2.2.2 && ruby setup.rb

# RUN gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
#RUN gem install sass --version 3.2.19
#RUN gem install compass --version 0.12.5
RUN yes | gem install jekyll --version 2.5.3
RUN gem install jekyll-compass jekyll-sitemap jekyll-paginate
RUN gem install rdiscount kramdown pygments.rb
RUN pip install -U pip
RUN pip install pygments --upgrade

VOLUME /src
EXPOSE 80

RUN mkdir /jekyll
ADD blog /jekyll/blog
WORKDIR /jekyll/blog
RUN jekyll build

RUN rm -rf /etc/nginx/sites-enabled/default
ADD nginx/shanhh.com /etc/nginx/sites-available/shanhh.com
RUN ln -s /etc/nginx/sites-available/shanhh.com /etc/nginx/sites-enabled/shanhh.com

ADD ./bin/entrypoint.sh /jekyll/entrypoint.sh

ENTRYPOINT ["/jekyll/entrypoint.sh"]
