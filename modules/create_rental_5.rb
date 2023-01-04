module CreateRental
  def create_rental
    book_data = read_and_parse_json('books.json')
    people_data = read_and_parse_json('people.json')
    rentals_data = read_and_parse_json('rentals.json')
    if book_data['books'].empty? || (people_data['students'].empty? && people_data['teachers'].empty?)
      return puts 'No books or people found'
    end

    books = book_data['books']
    people = people_data['students'] + people_data['teachers']
    rentals = rentals_data['rentals']
    select_book(books)
    book_index = gets.chomp.to_i
    select_person(people)
    person_index = gets.chomp.to_i
    print 'Date: '
    date_info = gets.chomp
    rental = { date: date_info, book: books[book_index], person: people[person_index] }
    rentals << rental unless @rentals.include?(rental)
    json = rentals_data.to_json
    File.write('rentals.json', json)
    puts 'Rental created successfully'
  end

  def read_and_parse_json(filename)
    file = File.read(filename)
    JSON.parse(file)
  end

  def select_book(books)
    puts 'Select a book from the following list by number'
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  def select_person(people)
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "#{index}) Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end
end
