FROM fluent/fluentd
RUN gem install faraday -v 1.10.3
RUN gem install fluent-plugin-elasticsearch --no-rdoc --no-ri --version 2.1.0
RUN gem install fluent-plugin-grok-parser --no-rdoc --no-ri
ADD fluent.conf /fluentd/etc
