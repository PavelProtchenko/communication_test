class Body
  attr_reader :points

  def initialize(questions_path)
    unless File.exist?(questions_path)
      abort "File doesn't exist #{questions_path}"
    end

    file = File.new(questions_path, "r:UTF-8")
    @questions = file.readlines
    file.close

    @points = 0
    @current_question = 0
  end

  def finished?
    @current_question >= @questions.size
  end

  def next_question
    puts @questions[@current_question]

    user_input = nil
    until user_input == 1 || user_input == 2 || user_input == 3
        puts "Введите \"1 - да\", \"2 - нет\" или \"3 - иногда\" и нажмите \"Ввод\""
        user_input = STDIN.gets.to_i
    end

    if user_input == 1
      @points += 2
    elsif user_input == 3
      @points += 1
    end

    @current_question += 1
  end

end
