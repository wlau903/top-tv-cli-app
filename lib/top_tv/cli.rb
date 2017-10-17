class TopTv::CLI

  def call
    main_menu
    goodbye
  end

  def main_menu
    puts ""
    puts "Welcome to Top TV Shows!"
    puts ""
    #scrape categories, then list
    puts <<~HEREDOC
      1. New TV Tonight
      2. Most Popular TV
      3. Top TV Comedies
      4. Top TV Dramas
      5. Top Sci-fi/Horror/Fantasy
    HEREDOC

    puts ""
    puts "Please enter the corresponding number or enter exit to quit:"
    input = gets.strip.downcase

    #list_shows(input)
    if input != "exit"
      puts "list of shows..."
      puts ""
      puts "What show would you like more info on?"
      input = gets.strip.to_i

      #list_show(input)
      puts "Great, you've chosen show #{input}!"
      puts "Is there another show that you'd like to learn more about? (y/n)"
      input = gets.strip.downcase
      if input == "y"
        main_menu
      end
    end

  end

  def goodbye
    puts "Goodbye!"
  end

end
