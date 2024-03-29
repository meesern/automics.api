
Given /^([^g][^\s]+) (.+) exists$/ do |type, name|
  eval(type.capitalize).create! :name=>name
end

Given /^group (.+) exists$/ do |group|
  Group.create! :name=>group, :organisation=>Organisation.first 
end

Given /^panel (.+) belongs to (.+)$/ do |panel, comic|
  @comic = Comic.find_by_name(comic)
  Panel.create! :id=>panel.to_i, :comic=>@comic
end

Given /^annotation (.+) belongs to panel (.+)$/ do |annotation, panel_id|
  @panel = Panel.find(panel_id.to_i)
  Annotation.create! :text=>annotation, :panel=>@panel
end

Given /^photo (.+) belongs to group (.+)$/ do |photo, group|
  @group = Group.find_by_name(group)
  Photo.create! :description=>photo, :group=>@group
end

#      not photo,ann' or panel but someother...
Given /^(?!(photo|annotation|panel))(\w+) (.+) belongs to (\w+) (.+)$/ do |_,source_class, source_name, belongs_class, belongs_name|
  @belong = eval(belongs_class.capitalize).find_by_name(belongs_name)
  @source = eval(source_class.capitalize).find_or_create_by_name(source_name)
  @source.send(:"#{belongs_class}=",@belong)
  @source.save
end

Given /^theme (.+) is the (.+) current theme$/ do |theme, group|
  @theme = Theme.find_by_name(theme)
  @group = Group.find_by_name(group)
  @group.current_theme = @theme
  @group.save
end

Given /^a photo with (.+) is on panel (.+)$/ do |filename, panel|
  @photo = Photo.new
  @photo.image = File.open(::Rails.root.to_s+"/features/test_images/"+filename)
  @photo.save
  @panel = Panel.find(panel)
  @panel.photo = @photo
  @panel.save
end

Given /^resource (.+) is placed on panel (\d+) at ([\d.]+),([\d.]+) scale ([\d.]+)$/ do |resource, panel, x, y, scale|
  @resource = Resource.find_or_create_by_name(resource)
  @panel = Panel.find(panel)
  @panel.placements.create(:resource=>@resource, :xoff=>x, :yoff=>y, :scale=>scale)
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

#---------------------------------------------------------------------

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

Then /^I should get a list of (.+)$/ do |things|
    resp = parse_page(page.html)
    assert resp[:"#{things}"].class == Array
    assert resp[:"#{things}"].length > 0
end

Then /^I should get (.+) locations$/ do |things|
    resp = parse_page(page.html)
    assert resp[:"#{things}"].class == Array
    assert resp[:"#{things}"].length > 0
end

Then /^I should get a photo location with (.+)$/ do |text|
    resp = parse_page(page.html)
    assert resp[:image_url] =~ /photos\/.*\/#{text}/
end

Then /^I should get placement at ([\d.]+) ([\d.]+) scale ([\d.]+)$/ do |x, y, scale|
    assert_keyval_on_page("xoff", x, page)
    assert_keyval_on_page("yoff", y, page)
    assert_keyval_on_page("scale", scale, page)
end

Then /^I should not get placement at ([\d.]+) ([\d.]+) scale ([\d.]+)$/ do |x, y, scale|
    #This isn't quite true of course - a placement could have
    #any one of these values but it will do for our purpose
    assert_no_keyval_on_page("xoff", x, page)
    assert_no_keyval_on_page("yoff", y, page)
    assert_no_keyval_on_page("scale", scale, page)
end

Then /^I should get an image$/ do
  resp = parse_page(page.html)
  assert resp.has_key? :image_url
end

Then /^I should get a thumbnail$/ do
  resp = parse_page(page.html)
  assert resp.has_key? :thumb_url
end

Then /^I should get panel (\d+) before panel (\d+)$/ do |panel1, panel2|
  resp = parse_page(page.html)
  low = resp[:panels].find {|obj| obj[:id] == panel1.to_i}
  hi  = resp[:panels].find {|obj| obj[:id] == panel2.to_i}
  assert low[:page_order] < hi[:page_order]
end


#
#-------------------------------------------------------------
#
Then /^to do$/ do
  #This step is still unimplemented
  pending 
end


