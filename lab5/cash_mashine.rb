class CashMachine
    def initialize
      @balance = 100
      @bank_account = 'balance.txt'
      @choice
    end
  
    def bank_account()
      if File.exist?(@bank_account)
        balance = File.read(@bank_account).chomp.to_i
      else puts 'Файл не существует'
      end
      puts('Ваш балланс: ', @balance)
    end
  
    def menu
      puts('==========')
      puts('Меню: ')
      puts('D - внести деньги')
      puts('W - вывести деньги')
      puts('B - проверить балланс')
      puts('Q - выход')
      @choice = gets.chomp.strip.upcase
    end
  
    def init
      loop do
        menu
        case @choice
          when 'D'
            deposit
          when 'W'
            withdraw
          when 'B'
            balance
          when 'Q'
          else
          puts('Некорректная команда меню')
        end
      break if @choice == 'Q'
      end
    end
  
    def deposit
      puts 'Введите сумму депозита:'
      d = gets.to_i
      if d > 0
        @balance += d
        File.write(@bank_account, @balance, mode: 'w')
      else puts('Некорректная сумма депозита')
      end
    end
  
    def withdraw
      puts 'Введите сумму для вывода:'
      w = gets.to_i
      if w > 0 && w <= @balance
        @balance -= w
        File.write(@bank_account, @balance, mode: 'w')
      else puts 'Некорректная запрашиваемая сумма'
      end
    end
  
    def balance
      puts('Ваш балланс: ', @balance)
    end
  end
  
  bankAccount = CashMachine.new()
  bankAccount.bank_account
  bankAccount.init
