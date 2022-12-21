class Rental
  def initialize(date)
    @date = date
    @person = person
    book.rentals << self    
  end
  attr_accessor :date, :book
end
