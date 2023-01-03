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
      classroom: @classroom }
    file = File.read('people.json')
    data = JSON.parse(file)
    data['students'] << student_json
    json = data.to_json
    File.write('people.json', json)
  end

  # method to play
  def play_hooky
    '¯\(ツ)/¯'
  end
end
