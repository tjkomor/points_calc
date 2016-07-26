require 'nokogiri'
require 'open-uri'

class EspnService
  attr_reader :page1

  def initialize
    @page1 = Nokogiri::HTML(open("http://games.espn.go.com/ffl/tools/projections?sortMap=AAAAARgAAAAHAQAMc3RhdFNlYXNvbklkAwAAB%2BABAAhjYXRlZ29yeQMAAAACAQAJZGlyZWN0aW9uA%2F%2F%2F%2F%2F8BAAZjb2x1bW4D%2F%2F%2F%2F%2FQEAC3NwbGl0VHlwZUlkAwAAAAABABBzdGF0U291cmNlVHlwZUlkAwAAAAEBAAtzdGF0UXVlcnlJZAMAAAAB"))
  end
end
