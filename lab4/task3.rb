def task3
  if File.exists?('balance.txt')
    balance = File.read('balance.txt').chomp.to_i
  else 
    balance = 100.0
  end
  loop do
    puts('==========')
    puts('Меню: ')
    puts('D - внести деньги')
    puts('W - вывести деньги')
    puts('B - проверить балланс')
    puts('Q - выход')
    choice = gets.chomp.strip.upcase
    case choice
      when 'D'
      puts('Введите сумму депозита: ')
      d = gets.to_i
      if d > 0
        balance += d
        File.write('balance.txt', balance, mode: 'w')
      else
        puts('Некорректная сумма депозита')
      end
      when 'W'
      puts('Введите сумму для вывода: ')
      w = gets.to_i
      if w > 0 && w <= balance
        balance -= w
        File.write('balance.txt', balance, mode: 'w')
      else
        puts('Некорректная запрашиваемая сумма')
      end
      when 'B'
        puts('Ваш балланс: ', balance)
      when 'Q'
    else
      puts('Некорректная команда меню')
    end
    break if choice == 'Q'
  end
end


task3
