require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(35, 'Bob', specialization: 'Math') }

  describe '#can_use_services?' do
    it 'should return true' do
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#specialization=' do
    it 'should set the correct specialization' do
      teacher.specialization = 'Science'
      expect(teacher.specialization).to eq('Science')
    end
  end
end
