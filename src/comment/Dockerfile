# Build stage
FROM ruby:2.2-alpine AS build

RUN apk --no-cache add build-base

WORKDIR /app
COPY Gemfile* /app/

RUN bundle install

# Final stage
FROM ruby:2.2-alpine

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY --from=build /app /

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
