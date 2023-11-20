# Set Arguments
ARG RUBY_VERSION="3.2"

# Use an official Ruby runtime as a parent image
FROM ruby:${RUBY_VERSION}

# Set Environment Variables
ENV APP_USER=app
ENV APP_PATH=/app
ENV PORT=8080

# Add maintainer information
MAINTAINER "team@company.com"

# Add user
RUN useradd -d /home/${APP_USER} -m ${APP_USER}
RUN mkdir -p ${APP_PATH} && chown ${APP_USER}:${APP_USER} ${APP_PATH}

# Set working directory
WORKDIR $APP_PATH

# Copy the Gemfile and Gemfile.lock into the image.
ADD Gemfile Gemfile.lock /${APP_PATH}/

# Install needed gems
RUN bundle install

# Copy the rest of the application into the image
COPY --chown=$APP_USER:$APP_USER . /${APP_PATH}

# Run as non-root user
USER $APP_USER

# Make port 8080 available to the world outside this container
EXPOSE ${PORT}

# Command to run application
CMD ["./run.sh"]
