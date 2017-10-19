class TopTv::CLI

  def call
    main_menu
    list_shows
    goodbye
  end

  def main_menu
    puts ""
    puts "Welcome to Top TV Shows!"
    puts ""
    #scrape categories, then list
    @headings = TopTv::Heading.all
    @headings.each.with_index(1) do |heading, i|
      puts "#{i}. #{heading.name}"
    end
  end

  def list_shows
    puts ""
    puts "Please enter the corresponding number or enter exit to quit:"
    input = gets.strip.downcase

    if input != "exit"
      heading = @headings[input.to_i-1]
      #scrape shows, then list
      puts "#{heading.shows}"
      #binding.pry
      puts "What show would you like more info on?"
      shows = heading.shows.split(",")
      input = gets.strip.to_i

      #list_show(input)
      shows[input]
      puts "Is there another show that you'd like to learn more about? (y/n)"
      input = gets.strip.downcase
      if input == "y"
        main_menu
        list_shows
      end
    end

  end

  def goodbye
    puts "Goodbye!"
  end

end
