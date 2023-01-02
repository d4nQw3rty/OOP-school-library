require './student'
require './teacher'
require './book'
require './rental'
require './modules/menu'
require './modules/list_all_book_1'
require './modules/list_all_people_2'
require './modules/create_a_person_3'

class App
  include Menu
  include ListBooks
  include ListPeople
  include CreatePerson

  OPERATIONS = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person_id,
    7 => :exit
  }.freeze

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      menu
      option = gets.chomp.to_i
      operation = OPERATIONS[option]
      if operation == :exit
        break
      elsif operation
        send(operation)
      else
        puts 'That is not a valid input'
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts 'Book created successfully'
    @books << book
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental unless @rentals.include?(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.select do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
