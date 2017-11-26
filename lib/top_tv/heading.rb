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
