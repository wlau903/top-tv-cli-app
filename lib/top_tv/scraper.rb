class TopTv::Scraper

  def self.scrape_headings
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top-tv/")) #scrape home page
    left_column = doc.css("div.col-left").first #all left col headings and shows
    headings = left_column.css("section") #all headings and their shows, separated
  end

  def self.make_headings
    self.scrape_headings.each do |heading|
      name = heading.css("h2").text.gsub(" on RT", "")
      shows = heading.css("tr td.middle_col a").collect {|show| show.text.gsub(" View All ", "").gsub(",", "")}.join(",").split(",")
      TopTv::Heading.new(name, shows)
    end
  end

  def self.make_shows
    headings = self.scrape_headings
    shows = headings.css("tr td.middle_col a") #all shows
    shows.each do |show|
      name = show.text.gsub(" View All ", "").gsub(",", "")
      url = "https://www.rottentomatoes.com#{show.attr("href")}"
      TopTv::Show.new(name, url)
    end
  end

end
