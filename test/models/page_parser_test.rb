require './test/test_helper'
require 'open-uri'

class ParserTest < ActiveSupport::TestCase

  def open_link
    url = "./test/support/qb_list.html"
    open_file = (Nokogiri::HTML(open(url)))
    PageParser.new(open_file)
  end

  test 'can return filtered players' do
    open_link
    quarterbacks = open_link.return_players('QB')
    assert quarterbacks.include?("Eli Manning")
    assert quarterbacks.include?("Kirk Cousins")
    assert quarterbacks.include?("Matt Ryan")
    refute quarterbacks.include?("PMatt Ryan")
    refute quarterbacks.include?("SSPDEli Manning")
    refute quarterbacks.include?("PKirk Cousins")
  end

  test 'it can filter out SSPD tag' do
    open_link

    assert_equal open_link.sspd_filter('SSPDEli Manning'), "Eli Manning"
  end

  test 'it can filter out P tag' do
    open_link
    assert_equal open_link.p_filter("PKirk Cousins"), "Kirk Cousins"
  end
end
