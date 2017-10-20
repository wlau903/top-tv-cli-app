class TopTv::Heading
  attr_accessor :name, :shows, :url

  @@all = []

  def self.new_from_home_page(heading)
    self.new(
      heading.css("h2").text,
      heading.css("a").text,
      heading.css("a").attr("href").value #need to fix
    )
  end

  def initialize(name, shows, url)
    @name = name
    @shows = shows
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
