
module FeatureHelpers
  def showpage(page)
    puts page.html
  end

  def parse_page(page)
    JSON.parse(page, :symbolize_names => true)
  end
  
  def assert_no_keyval_on_page(key, val, page)
    pass = !(keyval_on_page(key, val, page))
    showpage(page) unless pass
    assert pass
  end
  def assert_keyval_on_page(key, val, page)
    pass = keyval_on_page(key, val, page)
    showpage(page) unless pass
    assert pass
  end
  def keyval_on_page(key, val, page)
    pass = page.has_content?(key)
    pass &&= page.has_content?(val.to_s)
  end

  def assert_keyval_on_response(key, val, response)
    pass = (response.body.match(/"#{key}":\s*"?#{val.to_s}"?/))
    p response unless pass
    assert pass
  end

  def has_sha1_hash?(data)
    (data[:hashid].length == 40)
  end

end

World(FeatureHelpers)

