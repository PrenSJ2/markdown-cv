FROM ruby:2.6

RUN bundle config mirror.https://rubygems.org

COPY ./Gemfile ./Gemfile

RUN \
    gem update --system --quiet && \
    gem install bundler -v '~> 2.1' && \
    bundle install && \
    rm ./Gemfile

ENV BUNDLER_VERSION=2.1

WORKDIR /app