require 'nokogiri'
require 'open-uri'

class EspnService
  attr_reader :page1

  def initialize
    @quarterbacks = Nokogiri::HTML(open("http://games.espn.go.com/ffl/tools/projections?&slotCategoryId=0"))
  end
end
