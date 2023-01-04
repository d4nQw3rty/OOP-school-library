require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new(1) }
  let(:student) { Student.new(18, 'Alice', parent_permission: true) }

  describe '#initialize' do
    it 'should set the correct label' do
      expect(classroom.label).to eq(1)
    end

    it 'should initialize an empty array of students' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'should add the student to the classroom\'s list of students' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'should set the student\'s classroom to the current classroom' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
