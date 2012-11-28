source 'http://rubygems.org'

gem 'rails', '3.0.17'
gem 'sqlite3'
gem 'mysql'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'
gem "hobo", "= 1.3.2"
#gem "facets"  Facets not compatible with hobo/rails :(
gem 'carrierwave'
gem 'rmagick'
gem 'WikiCreole'
gem 'rabl'
gem 'map_by_method'   # Needed by IRB on my mac ubuntu 11 VM for some reason 
gem 'wirble' 
gem 'andand'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
 group :development, :test do
  gem 'debugger'
  #gem 'linecache19', '~> 0.5.13'
  #gem 'ruby-debug-base19','~>0.11.26'
  #gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'spork'
  gem 'launchy'
  gem 'capybara' 
  gem 'rev' #for watchr
  gem 'database_cleaner'
  gem 'steak'
  #gem 'ruby_gntp', :require=>false #for guard: has dependancy problems with ffi
  #gem 'growl',     :require=>false #for guard: ditto
  gem 'rb-inotify', :require=>false #for guard-cucumber
  gem 'rb-fsevent', '~> 0.9.1', :require=>false  #for guard-cucumber on mac
  gem 'guard-cucumber'
 end

 group :test do 
  gem 'cucumber-rails'
 end

