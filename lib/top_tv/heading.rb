class TopTv::Heading
  attr_accessor :name, :shows

  @@all = []

  def self.new_from_home_page(heading)
    self.new(
      heading.css("h2").text.gsub(" on RT", ""),
      heading.css("tr td.middle_col a").collect {|show| show.text.gsub(" View All ", "").gsub(",", "")}.join(",").split(",")
    )
  end

  def initialize(name, shows)
    @name = name
    @shows = shows
    @@all << self
  end

  def self.all
    @@all
  end

end
