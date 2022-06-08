module Comments
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        print 'Choose verb to interact with comments (SHOW/ADD) / q to exit: '
        verb = gets.chomp
        break if verb == 'q'
        if (verb != "ADD" && verb != "SHOW")
          puts "Illegal input! Try again" 
          next
        end
  
        action = nil
  
  
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
  
  
  
  
  module Resource
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        verb = gets.chomp
        break if verb == 'q'
        if (verb != "GET" && verb != "POST" && verb != "PUT" && verb != "DELETE")
          puts "Illegal input! Try again" 
          next
        end
  
        action = nil
  
        if verb == 'GET'
          print 'Choose action (index/show) / q to exit: '
          action = gets.chomp
          break if action == 'q'
          if (action != "index" && action != "show")
            puts "Illegal input! Try again" 
            next
          end
        end
  
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
  
  class CommentsController
    extend Comments
    def initialize
      $comments = []
    end
  
    def show
  
      if $posts.empty? 
        puts('Постов не найдено')
        return
      end
      
      puts('Введите id просматриваемого поста')
      id = gets.to_i 
      if $comments[id-1].empty? 
        puts('Комментариев не найдено')
        return
      end
      puts('ID поста: ', id)
      puts('Пост: ', $posts[id-1])
      puts('Комментарии: ')
      $comments[id-1].each.with_index do |string, index|
        puts("#{index+1}:     #{string}")
      end
    end
  
    
    def add
      if $posts.empty? 
        puts('Постов не найдено')
        return
      end
      puts "Введите id комментируемого поста"
      id = gets.to_i
      puts('ID поста: ', id)
      puts('Пост: ', $posts[id-1])
      puts('Введите комментарий: ')
      string = gets.chomp
      $comments[id-1].push(string) 
    end
  end
  
  
  class PostsController
    extend Resource
    
    def initialize
      $posts = []
    end
  
    def index
      if $posts.empty? 
        puts('Постов не найдено')
        return
      end
      $posts.each.with_index do |string, index|  
        puts('Index: #{index+1} post: #{string}')
      end
    end
  
    def show
      puts('Введите id просматриваемого поста')
      id = gets.to_i
      while !id.integer? do
        puts('Некорректный ввод id')
        id = gets.to_i
      end
      $posts.each.with_index do |string, index|
        if index+1 == id
          puts("Найденный пост: #{string}")
        end
      end
    end
  
    def create
      commentsList = []
      puts('Введите пост: ')
      string = gets.chomp
      $posts.push(string)
      $comments.push(commentsList)
      puts("Индекс добавленного поста: #{$posts.size}")
    end
  
    def update
      puts('Введите id редактируемого поста')
      id = gets.to_i
      puts('Введите текст')
      str = gets.chomp
      $posts.each.with_index do |string, index|
        if index.eql == id
          string = str
        end
      end
    end
  
    def destroy
      puts('Введите id удаляемого поста')
      id = gets.to_i
      list = []
      commentsList = []
      $posts.each.with_index do |string, index|
        if index != id-1
          commentsList.push($comments[index])
          list.push(string)
        end
      end
        if list.empty?
          puts('Не найдено постов с заданным id')
        else 
          puts('Удалено!')
          $posts = list
          $comments = commentsList
        end
    end
  end
  
  class Router
    def initialize
      @routes = {}
    end
  
    def init
      resources(PostsController, CommentsController, 'posts')
  
      loop do
        print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
        choise = gets.chomp
  
        PostsController.connection(@routes['posts']) if choise == '1'
        CommentsController.connection(@routes['posts']) if choise == '2'
        break if choise == 'q'
      end
  
      puts 'Good bye!'
    end
  
    def resources(klass1, klass2, keyword)
      postsController = klass1.new
      commentsController = klass2.new
      @routes[keyword] = {
        'SHOW' => commentsController.method(:show),
        'ADD' => commentsController.method(:add),
        'GET' => {
          'index' => postsController.method(:index),
          'show' => postsController.method(:show)
        },
        'POST' => postsController.method(:create),
        'PUT' => postsController.method(:update),
        'DELETE' => postsController.method(:destroy)
      }
    end
  end
  
  router = Router.new
  
  router.init
