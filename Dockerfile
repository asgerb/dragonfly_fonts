FROM tomasce/modulor-base:latest
MAINTAINER Tomas Celizna <tomas.celizna@gmail.com>

RUN mkdir /app
WORKDIR /app

RUN mkdir lib
RUN mkdir lib/dragonfly_fonts

ADD Gemfile Gemfile
ADD dragonfly_fonts.gemspec dragonfly_fonts.gemspec
ADD lib/dragonfly_fonts/version.rb lib/dragonfly_fonts/version.rb

RUN bundle install
ADD . /app
