FROM ruby:2.6.3
RUN apt-get update && apt-get install -qq -y --no-install-recommends nano build-essential libpq-dev imagemagick curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn
ENV INSTALL_PATH /desafio-back-end
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
ENV BUNDLE_PATH /gems
COPY Gemfile Gemfile.lock ./
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . .

