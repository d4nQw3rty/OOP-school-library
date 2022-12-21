# Importing the Person class from person.rb

require './person'
require './classroom'
# Class: Student inherits from Person
class Student < Person
  # getter method
  attr_reader :classroom

  # initialize method adds a new instance variable @classroom

  def initialize(*person, classroom)
    super(*person)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  # method to play
  def play_hooky
    '¯\(ツ)/¯'
  end
end
