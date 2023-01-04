require_relative '../rental'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(21, 'John Smith', parent_permission: false) }
  let(:rental) { Rental.new('2022-01-01', book, person) }

  describe '#initialize' do
    it 'should set the correct date' do
      expect(rental.date).to eq('2022-01-01')
    end

    it 'should set the correct book' do
      expect(rental.book).to eq(book)
    end

    it 'should set the correct person' do
      expect(rental.person).to eq(person)
    end
  end
end
