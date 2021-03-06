source 'https://gems.ruby-china.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'wechat'
gem 'omniauth-wechat-oauth2'
gem 'aasm', '~> 4.12', '>= 4.12.3'

gem 'devise', '~> 4.3'
gem 'devise-async', '~> 1.0'
gem 'redis', '~> 3.0'
gem 'sidekiq', '~> 5.0', '>= 5.0.4'
gem 'cancancan', '~> 2.0'
gem 'rolify', '~> 5.1'
gem 'kaminari'
gem 'cocoon', '~> 1.2', '>= 1.2.10'
gem 'carrierwave', '~> 1.2', '>= 1.2.1'
gem 'mini_magick', '~> 4.8'
gem 'ransack', '~> 1.8', '>= 1.8.4'

gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'popper_js', '~> 1.12.3'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'letter_avatar', '~> 0.3.6'
gem 'dropzonejs-rails', '~> 0.8.2'

gem 'chartkick', '~> 2.2', '>= 2.2.4'
gem 'groupdate', '~> 3.2'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# 配置
gem 'settingslogic'

group :production do
  gem 'mysql2', '>= 0.3.18', '< 0.5'
end

gem 'faker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  gem "letter_opener"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Use Capistrano for deployment
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  # gem 'capistrano-bundler'
  # gem 'capistrano/passenger'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
