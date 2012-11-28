
Given /^([^g][^\s]+) (.+) exists$/ do |type, name|
  eval(type.capitalize).create! :name=>name
end

Given /^group (.+) exists$/ do |group|
  Group.create! :name=>group, :organisation=>Organisation.first 
end

Given /^theme (.+) belongs to (.+)$/ do |theme, org_name|
  org = Organisation.find_by_name(org_name)
  Theme.create! :name=>theme, :organisation=>org
end

Given /^resource (.+) belongs to (.+)$/ do |resource, theme_name|
  theme = Theme.find_by_name(theme_name)
  Resource.create! :name=>resource, :theme=>theme
end

Given /^photo (.+) belongs to (.+)$/ do |photo, group_name|
  group = Group.find_by_name(group_name)
  Photo.create! :description=>photo, :group=>group
end

Given /^annotation (.+) exists$/ do |annotation|
  Resource.create! :text=>annotation
end

#--------------------------------------------------------------

When /^I get endpoint (.+)$/ do |endpoint|
  visit(endpoint)
end

When /^I post endpoint (.+) with (.+)$/ do |endpoint, data|
  @response = post(endpoint,data)
end

When /^I delete endpoint (.+)$/ do |endpoint|
  @response = delete(endpoint)
end

Then /^response should have ([^ ]+): (.*)$/ do |key, content|
  assert_keyval_on_response(key, content, @response)
end

Then /^response should have a SHA1 hash/ do 
  data = parse_page(@response.body)
  pass = has_sha1_hash?(data)
  p @response unless pass
  assert pass
end

Then /^I should get (.+) results?$/ do |count|
  data = parse_page(page.html)
  pass = (data.count == count.to_i)
  showpage(page) unless pass
  assert pass
end

Then /^I should get a SHA1 hash$/ do 
  pass = has_sha1_hash?(parse_page(page.html).first)
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

Then /^I should not get ([^ ]+): (.*)$/ do |key, content|
  assert_no_keyval_on_page(key, content, page)
end

Then /^Show me the Result$/ do 
  showpage(page)
end

Then /^Show me the Response$/ do 
  p @response.body
end

Then /^I should get a list of themes$/ do
    resp = parse_page(page.html)
    assert resp[:themes].class == Array
    assert resp[:themes].length > 0
end

Then /^I should get a list of resources$/ do
    resp = parse_page(page.html)
    assert resp[:resources].class == Array
    assert resp[:resources].length > 0
end

Then /^I should get the actual photo$/ do
  pending 
end

Then /^do later$/ do
  pending # express the regexp above with the code you wish you had
end

