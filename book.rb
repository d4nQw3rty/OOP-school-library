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
end
