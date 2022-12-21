require './book'
class Rental
  def initialize(date)
    @date = date
    @person = person
    book.rentals << self
    person.rentals << self
  end
  attr_accessor :date, :book, :person
end
