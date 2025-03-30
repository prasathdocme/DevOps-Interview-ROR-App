FROM ruby:3.2.2-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs shared-mime-info curl npm
RUN npm install -g yarn
RUN mkdir -p /var/app
WORKDIR /var/app
COPY ../Gemfile Gemfile
COPY ../Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5
ADD . .
RUN bundle clean --force
RUN bundle exec rails assets:precompile
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/bin/sh", "/usr/bin/entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
