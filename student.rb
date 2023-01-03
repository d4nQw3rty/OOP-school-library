# Importing the Person class from person.rb
require 'json'
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

  def save_student
    # save student to file
    student_json = { id: @id, age: @age, name: @name, parent_permission: @parent_permission,
                     classroom: @classroom }.to_json
    File.open('students.json', 'a') do |file|
      file.puts student_json
    end
  end

  # method to play
  def play_hooky
    '¯\(ツ)/¯'
  end
end
