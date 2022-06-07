def index(file_name)
  if File.exist?(file_name)
    File.foreach(file_name) { |student| return student }
  else
    return 'Файл не существует'
  end
end


def find(id, file_name)
  if File.exist?(file_name)
    File.foreach(file_name).with_index do |student, index|
      return(student) if index == id
    end
  else
    return 'Файл не существует'
  end
end


def where(pattern, file_name)
  if File.exist?(file_name)
    flag = false
    File.foreach(file_name).with_index do |student, index|
      if student.include?(pattern)
        return index
        flag = true
      end
    end
  else
    return 'Файл не существует'
  end
  return 'Совпадений не найдено' if flag == false
end


def update(id, text, file_name)
  file = File.open('buffer.txt', 'w')
  File.foreach('students.txt').with_index do |student, index|
    file.puts(id == index ? text : student)
  end
  file.close
  File.write('students.txt', File.read('buffer.txt'))
  File.delete('buffer.txt') if File.exist?('buffer.txt')
end


def delete(id, file_name)
  file = File.open('buffer.txt', 'w')
  File.foreach('students.txt').with_index do |student, index|
    file.puts(student) if index != id
  end
  file.close
  File.write('students.txt', File.read('buffer.txt'))
  File.delete('buffer.txt') if File.exist?('buffer.txt')
end


FILE_PATH = 'students.txt'
puts(index(FILE_PATH))
puts(find(11, FILE_PATH))
puts(where('Иванов', FILE_PATH))
puts(update(0, 'Гордиенко Илья 20', FILE_PATH))
puts(delete(0, FILE_PATH))
