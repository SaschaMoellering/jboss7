# A sample Gemfile
source "https://rubygems.org"

group :lint do
  gem 'foodcritic', '~> 3.0', github: 'acrmp/foodcritic'
  gem 'rubocop', '~> 0.21'
  gem 'rainbow', '< 2.0'
  gem 'rake'
end

group :unit do
  gem 'berkshelf',  '~> 3.1'
  gem 'chefspec',   '~> 3.4'
end

group :kitchen_common do
  gem 'test-kitchen', '~> 1.2'
  gem 'chef-zero'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant'
end


group :development do
  gem 'ruby_gntp'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard', '~> 2.6'
  gem 'guard-kitchen'
  gem 'guard-foodcritic'
  gem 'guard-rspec'
  gem 'guard-rubocop'
end

