require 'json'
require './person'
# Class: Teacher inherits from Person
class Teacher < Person
  # initialize method adds a new instance variable @specialization
  def initialize(*person, specialization)
    super(*person)
    @specialization = specialization
  end

  # method to always return true in can_use_services?
  def can_use_services?
    true
  end

  def save_teacher
    # save teacher to file
    teacher_json = { id: @id, age: @age, name: @name, parent_permission: @parent_permission,
                     specialization: @specialization }.to_json
    File.open('teachers.json', 'a') do |file|
      file.puts teacher_json
    end
  end

  # getter method
  attr_accessor :specialization
end
