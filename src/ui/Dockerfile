# Build stage
FROM alpine:3.13 AS build
RUN apk add --update --no-cache ruby-full ruby-dev build-base
RUN gem install bundler:1.17.2 --no-document

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Final stage
FROM alpine:3.13
RUN apk add --update --no-cache ruby-full
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY --from=build $APP_HOME $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
