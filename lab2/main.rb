def greeting
  name = gets.chomp
  surname = gets.chomp
  age = gets.to_i
  if age < 18
    "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано."
  else
    "Привет‚ #{name} #{surname}. Самое время заняться делом!"
  end
end

def foobar(x, y)
  if x == 20 || y == 20
    y
  else
    x + y
  end
end

puts(greeting)
puts(foobar(10, 20))
