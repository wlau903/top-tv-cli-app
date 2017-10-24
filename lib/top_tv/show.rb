class TopTv::Show
  attr_accessor :name, :url, :description, :genre, :network, :premiere_date

  @@all = []

  def self.new_from_home_page(show)
    self.new(
      show.text.gsub(" View All ", "").gsub(",", ""),
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

  def premiere_date
    @premiere_date ||= doc.css("div.meta-value")[2].text.strip
  end

  def network
    @network ||= doc.css("div.meta-value")[1].text.strip
  end

  def genre
    @genre ||= doc.css("div.meta-value").first.text.strip
  end

  def description
    @description ||= doc.css("div.movie_synopsis").text.strip
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
