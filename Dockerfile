FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update &&  apt install yarn

RUN yarn install --check-files

ADD . /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.2.19

RUN bundle check || bundle install

COPY . ./

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
