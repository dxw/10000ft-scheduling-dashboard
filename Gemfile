source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.5.1'
gem 'rails', '5.2.2.1'
gem 'rails-html-sanitizer', '~> 1.0.4' # CVE-2018-3741

gem 'puma'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'nokogiri', '~> 1.10.8' # CVE-2017-18258
gem 'loofah', '>= 2.2.3' # CVE-2018-16468

gem 'httparty'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'webmock'
  gem 'timecop'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'haml-rails'
gem 'jquery-rails'

group :development do
  gem 'better_errors'
  gem 'bundler-audit'
  gem 'html2haml'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop'
end
group :test do
  gem 'launchy'
end
