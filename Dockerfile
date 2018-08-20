FROM ruby:latest

ENV PROJECT_ROOT /usr/src/app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

WORKDIR $PROJECT_ROOT
