FROM ruby:2.6.3

RUN mkdir /app
WORKDIR /app

COPY ./Gemfile ./Gemfile.lock /app/

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

RUN gem install bundler
RUN bundle install

COPY . /app

EXPOSE 3000

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh