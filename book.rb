require './rental'
require 'json'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def save_book
    # save book to file
    file = File.read('books.json')
    data = JSON.parse(file)
    book_json = { title: @title, author: @author }
    data['books'] << book_json
    json = data.to_json
    File.write('books.json', json)
  end

  def load_books
    # load books from file
    File.open('books.json', 'r') do |file|
      file.readlines.each do |line|
        book = JSON.parse(line, symbolize_names: true)
        @books << Book.new(book[:title], book[:author])
      end
    end
  end

  def add_rental(date, person)
    @rentals.push(Rental.new(date, self, person))
  end
end
