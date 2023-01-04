module ListPeople
  def list_people
    people_file = './people.json'

    if JSON.parse(File.read(people_file))['teachers'].empty? && JSON.parse(File.read(people_file))['students'].empty?
      puts 'No people found'
    else
      puts 'These are the people:'
      data = File.read(people_file)
      people_data = JSON.parse(data)
      students = people_data['students']
      teachers = people_data['teachers']
      students.each do |student|
        puts "ID: #{student['id']}, Name: #{student['name']}, Age: #{student['age']} "
      end
      teachers.each do |teacher|
        puts "ID: #{teacher['id']}, Name: #{teacher['name']}, Age: #{teacher['age']}, Sp: #{teacher['specialization']} "
      end
    end
  end
end
