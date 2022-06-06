def task1(word)
  if word[-1].upcase == 'S' && word[-2].upcase == 'C'
    return 2 ** (word.length)
  else 
    return word.reverse
  end
end

def task2
  puts "Введите количество покемонов: "
  c = gets.to_i
  arr = []
  for i in 1..c
      hash = {}
      puts "Введите имя: "
      name = gets.to_s.strip
      puts "Введите цвет: "
      color = gets.to_s.strip
      hash = hash.merge ({name: name})
      hash = hash.merge ({color: color})
      arr[i] = hash.to_s
  end 
  return arr
end

puts "Введите слово: "
puts(task1(gets.to_s.strip))
puts (task2)
