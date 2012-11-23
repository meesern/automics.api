
Given /^organisation (.+) exists$/ do |org|
  Organisation.create! :name=>org
end

Given /^theme (.+) exists$/ do |theme|
  Theme.create! :name=>theme
end

Given /^group (.+) exists$/ do |group|
  Group.create! :name=>group, :organisation=>Organisation.first 
end

When /^I get endpoint (.+)$/ do |endpoint|
  visit(endpoint)
end

When /^I post endpoint (.+) with (.+)$/ do |endpoint, data|
  @response = post(endpoint,data)
end

Then /^response should have ([^ ]+): (.*)$/ do |key, content|
  assert_keyval_on_response(key, content, @response)
end

Then /^response should have a SHA1 hash/ do 
  data = dejson(@response.body)
  pass = has_sha1_hash?(data)
  p @response unless pass
  assert pass
end

Then /^I should get (.+) results$/ do |count|
  data = dejson(page.html)
  pass = (data.count == count.to_i)
  showpage(page) unless pass
  assert pass
end

Then /^I should get a SHA1 hash$/ do 
  pass = has_sha1_hash?(dejson(page.html).first)
  showpage(page) unless pass
  assert pass
end


Then /^I should get a url$/ do 
  pass = page.has_content?(@url1)
  showpage(page) unless pass
  assert pass
end

Then /^I should see (.*)$/ do |content|
  pass = page.has_content?(content)
  showpage(page) unless pass
  assert pass
end

Then /^I should get ([^ ]+): (.*)$/ do |key, content|
  assert_keyval_on_page(key, content, page)
end

Then /^Show me the Result$/ do 
  showpage(page)
end

Then /^do later$/ do
  pending # express the regexp above with the code you wish you had
end
 
