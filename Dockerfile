# Use the official Ruby image with version 3.1.1 as the base image
FROM ruby:3.1.1

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock /app/

# Install dependencies
RUN bundle install

# Copy the application code into the container
COPY . /app/

# Run Rails migrations
RUN rails db:migrate

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
