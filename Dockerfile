FROM ruby:2.4.1

ENV APP_ROOT /usr/src/sample

WORKDIR $APP_ROOT


# Install essential libraries
RUN apt-get update && apt-get install -y build-essential libpq-dev

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install nodejs

# Install yarn
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Fix: 'Cannot find module 'node-sass'
RUN yarn add node-sass

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
  bundle install

COPY . $APP_ROOT
EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0"]
