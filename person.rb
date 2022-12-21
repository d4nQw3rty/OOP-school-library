require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'
class Person < Nameable
  # initialize method
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end 

  # Public methods

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date)
    @rentals.push(date, self)
  end

  # Private methods

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedperson = CapitalizeDecorator.new(person)
capitalizedperson.correct_name
capitalizedtrimmedperson = Trimmerdecorator.new(capitalizedperson)
capitalizedtrimmedperson.correct_name
