# Importing the Person class from person.rb

require './person'
# Class: Student inherits from Person

class Student < Person
  # initialize method adds a new instance variable @classroom
  def initialize(*person, classroom)
    super(*person)
    @classroom = classroom
  end

  # method to play
  def play_hooky
    '¯\(ツ)/¯'
  end
  # getter method
  attr_accessor :classroom
end
