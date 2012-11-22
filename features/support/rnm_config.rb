#require 'rubygems'
#require 'ruby-debug'

#Debugger.start

Capybara.run_server = true #Whether start server when testing
Capybara.default_selector = :xpath #default selector , you can change to :css
Capybara.default_wait_time = 2 #When we testing AJAX, we can set a default wait time
Capybara.ignore_hidden_elements = false #Ignore hidden elements when testing, make helpful when you hide or show elements using javascript
Capybara.javascript_driver = :culerity #default driver when you using @javascript tag


#RNM We don't want to use fixtures in cucumber and they don't like the change of database
#table name 
#Before do
#  Fixtures.reset_cache
#  fixtures_folder = File.join(::Rails.root.to_s, 'test', 'fixtures')
#  fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
#  Fixtures.create_fixtures(fixtures_folder, fixtures)
#end

Cucumber::Rails::World.use_transactional_fixtures = false
DatabaseCleaner.strategy = :truncation

