require 'json'
module ListBooks
  def list_books
    file = './books.json'
    if JSON.parse(File.read(file))['books'].empty?
      puts 'No books found'
    else
      puts 'These are the books:'
      data = File.read(file)
      books_data = JSON.parse(data)
      books = books_data['books']
      books.each do |book|
        puts "Title: #{book['title']} Author: #{book['author']} "
      end
    end
  end
end
