class TopTv::Show
  attr_accessor :name, :url, :description, :genre, :network, :premiere_date

  @@all = []

  def self.new_from_home_page(show)
    self.new(
      show.text.gsub(" View All ", ""),
      "https://www.rottentomatoes.com#{show.attr("href")}"
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

  def description
    @description ||= doc.css("div.movie_synopsis").text.strip
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
