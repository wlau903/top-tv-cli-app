class TopTv::Show
  attr_accessor :name, :url

  @@all = []

  def self.new_from_home_page(show)
    self.new(
      show.text.gsub(" View All ", ""),
      show.attr("href")
    )
  end

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_show_by_name(chosen_show)
    self.all.detect { |show| show.name == chosen_show }
  end

end
