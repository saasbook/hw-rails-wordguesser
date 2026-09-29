# Docker image for CHIP 4.6 (Wordguesser on Rails).
#
# Builds an environment with the Ruby version and gems the assignment needs.
# GitHub Codespaces and the VS Code Dev Containers extension build this same
# file, via .devcontainer/devcontainer.json -- there is no separate dev image.
#
# It lives here in starter-code/ because that is what build_starter_code.json
# copies to the root of the generated starter repo, which is the build context
# the COPY paths below are relative to. (This chip has no solutions/ app: the
# starter code is the complete, working app that students read and run.)
FROM ruby:3.3.8

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

# The Rails app serves on http://localhost:3000 when started with
# `bin/rails server -b 0.0.0.0`
EXPOSE 3000

# Tip: run with `-v "$(pwd)":/app` so your local edits are visible inside the
# container without rebuilding the image (see DEVELOPING.md).
CMD ["bash"]
