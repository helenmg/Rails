FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ARG WORKDIR='/myapp'

RUN mkdir ${WORKDIR}
WORKDIR ${WORKDIR}

COPY Gemfile ${WORKDIR}/Gemfile
COPY Gemfile.lock ${WORKDIR}/Gemfile.lock

RUN bundle install

ADD . /myapp
