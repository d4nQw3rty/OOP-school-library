module ListBooks
  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end
end
