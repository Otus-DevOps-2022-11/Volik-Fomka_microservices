# Use the official Ruby image as the base image
FROM ruby:2.5.1

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock from the current directory to the container
COPY Gemfile Gemfile.lock ./

# Install the dependencies using Bundler
RUN bundle install

# Copy the application files from the current directory to the container
COPY . .

# Expose port 9292 for the application
EXPOSE 9292

# Start the application using the command "puma"
CMD ["puma"]
