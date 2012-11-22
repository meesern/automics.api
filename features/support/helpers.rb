
module FeatureHelpers
  def showpage(page)
    puts page.html
  end

  def json(page)
    JSON.parse(page.html)
  end
  
  def assert_keyval_on_page(key, val, page)
    pass = page.has_content?(key)
    pass &&= page.has_content?(val.to_s)
    showpage(page) unless pass
    assert pass
  end
end

World(FeatureHelpers)

