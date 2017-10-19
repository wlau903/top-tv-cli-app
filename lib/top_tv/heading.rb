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

new_tonight = TopTv::Heading.new("New TV Tonight", "The Good Place: Season 2, Gotham: Season 4, Great News: Season 2, How to Get Away With Murder: Season 4, Better Things: Season 2")
most_pop = TopTv::Heading.new("Most Popular TV", "shows")
top_com = TopTv::Heading.new("Top TV Comedies", "shows")
top_dram = TopTv::Heading.new("Top TV Dramas", "shows")
top_sci = TopTv::Heading.new("Top Sci-fi/Horror/Fantasy", "shows")
