class TopTv::Heading
  attr_accessor :name
  attr_reader :shows

  @@all = []

  def initialize(name)
    @name = name
    @shows = []
    @@all << self
  end

  def self.all
    @@all
  end

end
