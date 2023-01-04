require_relative '../book'

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  describe '#initialize' do
    it 'should set the correct title' do
      expect(book.title).to eq('The Great Gatsby')
    end
    it 'should set the correct author' do
      expect(book.author).to eq('F. Scott Fitzgerald')
    end
  end
  describe '#rentals' do
    it 'should return an empty array' do
      expect(book.rentals).to be_empty
    end
  end
end
