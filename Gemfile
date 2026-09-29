source 'https://rubygems.org'

ruby '>= 3.3.8'

gem 'rails', '~> 7.2.3'

# The Puma web server, which `rails server` starts [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  # Call `debugger` anywhere in the code to stop execution and get a debugger console
  # [https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem]
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
end

group :development do
  # Use console on exceptions pages or by using <%= console %> in views
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'webmock'
end
