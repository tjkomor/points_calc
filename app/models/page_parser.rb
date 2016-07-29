class PageParser
  attr_reader :page

  def initialize(page, position)
    @page = page
    @position = position
  end

  def return_players
    players = []
    page.css('.playertablePlayerName').text.split(@position).each do |qb|
      players << sspd_filter(qb).split(',').first.gsub(/\A\p{Space}*|\p{Space}*\z/, '')
    end
    @result = []
    players.each do |player|
      @result << p_filter(player)
    end
    @result
  end

  def white_space_filter(player)
    player.split(',').first.strip.gsub(/\A\p{Space}*|\p{Space}*\z/, '')
  end

  def sspd_filter(player)
    if player.include?("SSPD")
      player.gsub("SSPD", "")
    else
      player
    end
  end

  def p_filter(player)
    if player.split('')[0] == player.split('')[0].upcase && player.split('')[1] == player.split('')[1].upcase
      player[1..-1]
    else
      player
    end
  end

  def return_points
    @points_array = []
    page.css('.playertableStat').text.split('000').each_with_index do |pts, i|
      if i != 0
        @points_array << pts.split('.').first.to_i
      end
    end
    @points_array
  end

  def map_points
    return_points
    return_players
    index = 0
    totals = {}
    while index < 40 do
      totals[@result[index]] = @points_array[index]
      index += 1
    end
    binding.pry
    totals
  end

end
