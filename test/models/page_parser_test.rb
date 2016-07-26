require './test/test_helper'
require 'open-uri'

class ParserTest < ActiveSupport::TestCase

  test 'can open doc with nokogiri' do
    url = "http://games.espn.go.com/ffl/tools/projections?sortMap=AAAAARgAAAAHAQAMc3RhdFNlYXNvbklkAwAAB%2BABAAhjYXRlZ29yeQMAAAACAQAJZGlyZWN0aW9uA%2F%2F%2F%2F%2F8BAAZjb2x1bW4D%2F%2F%2F%2F%2FQEAC3NwbGl0VHlwZUlkAwAAAAABABBzdGF0U291cmNlVHlwZUlkAwAAAAEBAAtzdGF0UXVlcnlJZAMAAAAB"
    open_file = (Nokogiri::HTML(open(url)))
    PageParser.new(open_file)
    binding.pry
  end

end
