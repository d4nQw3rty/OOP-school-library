require './student'
require './teacher'
require './book'
require './rental'
require './modules/menu'
require './modules/list_all_book_1'
require './modules/list_all_people_2'
require './modules/create_a_person_3'
require './modules/create_book_4'
require './modules/create_rental_5'
require './modules/list_all_rentals_6'

class App
  include Menu
  include ListBooks
  include ListPeople
  include CreatePerson
  include CreateBook
  include CreateRental
  include ListAllRentals

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

end
