class Result
  def initialize(results_path)
    unless File.exist?(results_path)
			abort "File doesn't exist #{results_path}"
    end
    file = File.new(results_path, "r:UTF-8")
    @results = file.readlines
    file.close
  end

  def show(body)
    puts "\nВаш результат теста (ответов да - #{body.points}):"
    case body.points
    when (4..8) then puts @results[5]
    when (9..13) then puts @results[4]
    when (14..18) then puts @results[3]
    when (19..24) then puts @results[2]
    when (25..29) then puts @results[1]
    when (30..32) then puts @results[0]
    else
      puts @results[6]
    end
  end

end
