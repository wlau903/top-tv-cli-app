class TopTv::Scraper

  def self.scrape_headings
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top-tv/")) #scrape home page
    left_column = doc.css("div.col-left").first #all left col headings and shows
    shows = left_column.css("section") #all headings and their shows, separated
  end

  def self.make_headings
    self.scrape_headings.each do |heading|
      TopTv::Heading.new_from_home_page(heading)
    end
  end

end
