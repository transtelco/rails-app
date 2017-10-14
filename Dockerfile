FROM ruby:2.3.1

WORKDIR /usr/src/app/

RUN apt-get -q update && \
    apt-get -q -y install build-essential && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -q -y nodejs


COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY app/ app/
COPY config/ config/
COPY db/ db/
COPY test/ test/
COPY public/ public/
COPY Rakefile config.ru ./ 

ENTRYPOINT ["/bin/bash","-c"]

CMD ["rake db:migrate && rails server -b 0.0.0.0 -p 80"]
