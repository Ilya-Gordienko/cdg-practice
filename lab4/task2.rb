def task2
  file = File.open('students.txt')
  puts('Введите свой возраст (или -1, чтобы выйти): ')
  age = gets.to_i
  while age != -1
    file_res = File.open('results.txt', 'a')
    File.foreach(file).with_index do |student, index|
      if student.include?(age.to_s)
        File.write('results.txt', student, mode: 'a')
      end
    end
    file_res.close
    puts('Введите свой возраст (или -1, чтобы выйти): ')
    age = gets.to_i
  end
end

task2
