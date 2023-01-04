require_relative '../person'

describe Person do
  let(:person) { Person.new(21, 'John Smith', parent_permission: false) }

  describe '#initialize' do
    it 'should set the correct name' do
      expect(person.name).to eq('John Smith')
    end

    it 'should set the correct age' do
      expect(person.age).to eq(21)
    end

    it 'should set the correct id' do
      expect(person.id).to be_between(1, 1000)
    end

    it 'should set the correct value for parent_permission' do
      expect(person.instance_variable_get(:@parent_permission)).to eq(false)
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'should return true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age but has parent permission' do
      let(:person) { Person.new(17, 'Jane Smith', parent_permission: true) }

      it 'should return true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age and does not have parent permission' do
      let(:person) { Person.new(17, 'Jane Smith', parent_permission: false) }

      it 'should return false' do
        expect(person.can_use_services?).to be false
      end
    end
  end

  describe '#correct_name' do
    it 'should return the correct name' do
      expect(person.correct_name).to eq('John Smith')
    end
  end

  describe '#of_age?' do
    context 'when the person is of age' do
      it 'should return true' do
        expect(person.send(:of_age?)).to be true
      end
    end

    context 'when the person is not of age' do
      let(:person) { Person.new(17, 'Jane Smith', parent_permission: false) }

      it 'should return false' do
        expect(person.send(:of_age?)).to be false
      end
    end
  end
end
