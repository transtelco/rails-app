FROM ruby:2.3.1

WORKDIR /usr/src/app/

RUN apt-get -q update && \
    apt-get -q -y install build-essential postgresql-client && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -q -y nodejs


COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

VOLUME /usr/src/app/

EXPOSE 8000
ENTRYPOINT ["/bin/bash","-c"]
CMD ["rake db:migrate && puma"]
#CMD ["tail -f /dev/null"]
