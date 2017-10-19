class TopTv::Heading
  attr_accessor :name, :shows

  @@all = []

  def initialize(name, shows)
    @name = name
    @shows = shows
    @@all << self
  end

  def self.all
    @@all
  end

end

new_tonight = TopTv::Heading.new("New TV Tonight", "shows")
most_pop = TopTv::Heading.new("Most Popular TV", "shows")
top_com = TopTv::Heading.new("Top TV Comedies", "shows")
top_dram = TopTv::Heading.new("Top TV Dramas", "shows")
top_sci = TopTv::Heading.new("Top Sci-fi/Horror/Fantasy", "shows")
