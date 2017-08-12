# encoding: UTf-8
#

require_relative 'lib/body'
require_relative 'lib/result'

name = ARGV[0]

if (Gem.win_platform? and ARGV[0]) #...and ARGV[0] проверка на nil, если ввод пуст
  name = name.encode(ARGV[0].encoding, "cp1251").encode("UTF-8") #.encode("UTF-8")
end

if name == nil
  name = "Незнакомец"
  puts "Привет, #{name}!"
else
  puts "Привет, #{name}!"
end

puts
puts "Тест поможет определить ваш уровень коммуникабельности.\n
Для этого необходимо правдиво ответить на следующие вопросы."

puts "Инструкции:\n
За каждый ответ «да» поставьте себе 2 балла, за ответ «нет» — 0 баллов, за ответ " \
"«иногда» — 1 балл.\n
Затем суммируйте все баллы и сравните полученный результат со шкалой."

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

body = Body.new(questions_path)
result = Result.new(results_path)

until body.finished?
body.next_question
end

puts "\n#{name}, "

result.show(body)
