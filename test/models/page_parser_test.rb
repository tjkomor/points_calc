require './test/test_helper'
require 'open-uri'

class ParserTest < ActiveSupport::TestCase

  def open_link
    url = "./test/support/qb_list.html"
    open_file = (Nokogiri::HTML(open(url)))
    PageParser.new(open_file, 'QB')
  end

  test 'can return filtered players' do
    quarterbacks = open_link.return_players
    assert quarterbacks.include?("Eli Manning")
    assert quarterbacks.include?("Kirk Cousins")
    assert quarterbacks.include?("Matt Ryan")
    refute quarterbacks.include?("PMatt Ryan")
    refute quarterbacks.include?("SSPDEli Manning")
    refute quarterbacks.include?("PKirk Cousins")
  end

  test 'it can filter out SSPD tag' do
    assert_equal open_link.sspd_filter('SSPDEli Manning'), "Eli Manning"
  end

  test 'it can filter out P tag' do
    assert_equal open_link.p_filter("PKirk Cousins"), "Kirk Cousins"
  end

  test 'it can return points in array' do
    assert_equal open_link.return_points[0], 335
    assert_equal open_link.return_points[17], 246
  end

  test "it can map players to projected point totals" do
    cam = {"Cam Newton" => 335}
    assert_equal open_link.map_points.first, cam
  end
end
