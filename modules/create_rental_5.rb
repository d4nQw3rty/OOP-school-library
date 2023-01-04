module CreateRental
  def create_rental
    book_file=File.read('books.json')
    people_file=File.read('people.json')
    
    if JSON.parse(book_file)['books'].empty? || (JSON.parse(people_file)['students'].empty? && JSON.parse(people_file)['teachers'].empty?)
    
    puts 'No books or people found'
    
    else
    rentals_file= File.read('rentals.json')
    book_file = File.read('books.json')
    people_file = File.read('people.json')
    books_data = JSON.parse(book_file)
    people_data = JSON.parse(people_file)
    rentals_data = JSON.parse(rentals_file)
    books = books_data['books']
    students = people_data['students']
    teachers = people_data['teachers']
    rentals = rentals_data['rentals']
    people = students + teachers
    puts 'Select a book from the following list by number'
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |people, index|
      puts "#{index}) Name: #{people['name']}, ID: #{people['id']}, Age: #{people['age']}"      
    end   
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = {date: date, book: books[book_index], person: people[person_index]}
    rentals << rental unless @rentals.include?(rental)
    json = rentals_data.to_json
    File.write('rentals.json', json)
    puts 'Rental created successfully'
    end
    end
end
