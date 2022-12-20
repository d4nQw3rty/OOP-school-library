require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
class Person < Nameable
  # initialize method

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  # getter method

  attr_reader :id
  attr_accessor :name, :age

  # Public methods

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end
  # Private methods

  private

  def of_age?
    @age >= 18
  end
end
