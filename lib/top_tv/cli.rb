class TopTv::CLI

  def call
    TopTv::Scraper.make_headings
    main_menu
    list_shows
    goodbye
  end

  def main_menu
    puts ""
    puts "~~~ Welcome to Top TV Shows! ~~~"
    puts ""
    @headings = TopTv::Heading.all
    @headings.each.with_index(1) do |heading, i|
      puts "#{i}. #{heading.name}"
    end
  end

  def list_shows
    puts ""
    puts "Please enter the corresponding number or enter exit to quit:"
    input = gets.strip.downcase

    if input != "exit" && input <= "5"
      puts ""
      heading = @headings[input.to_i-1]
      puts "~~~ #{heading.name} ~~~"
      puts ""
      the_shows = heading.shows
      the_shows.each.with_index(1) do |show, i|
        puts "#{i}. #{show}"
      end
      TopTv::Scraper.make_shows
      puts ""
      puts "What show would you like more info on?"
      input = gets.strip.to_i

      chosen_show = the_shows[input.to_i-1]
      show = TopTv::Show.find_show_by_name(chosen_show)
      list_show_info(show)

      puts "Is there another show that you'd like to learn more about? (y/n)"
      input = gets.strip.downcase

      if input == "y"
        main_menu
        list_shows
      end
    else
      puts "Invalid choice, please try again"
      list_shows
    end
  end

  def list_show_info(show)
    puts ""
    puts "~~~ #{show.name} ~~~"
    puts ""
    puts "#{show.description}"
    puts ""
    puts "Genre: #{show.genre}"
    puts "Network: #{show.network}"
    puts "Premiere Date: #{show.premiere_date}"
    puts ""
  end

  def goodbye
    puts ""
    puts "Goodbye!"
  end

end
