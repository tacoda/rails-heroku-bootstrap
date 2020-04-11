FROM ruby:2.6.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client
# RUN export PATH="$PATH:`yarn global bin`"
RUN mkdir /rails-heroku-bootstrap
WORKDIR /rails-heroku-bootstrap
COPY Gemfile /rails-heroku-bootstrap/Gemfile
COPY Gemfile.lock /rails-heroku-bootstrap/Gemfile.lock
RUN bundle install
COPY . /rails-heroku-bootstrap

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]