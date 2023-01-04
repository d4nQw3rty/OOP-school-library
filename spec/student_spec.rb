require_relative '../student'

describe Student do
  let(:classroom) { Classroom.new(1) }
  let(:student) { Student.new(18, 'Alice', parent_permission: true, classroom:) }

  describe '#classroom=' do
    it 'should set the correct classroom' do
      new_classroom = Classroom.new(2)
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
    end

    it "should add the student to the classroom's list of students" do
      new_classroom = Classroom.new(2)
      student.classroom = new_classroom
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'should return the correct string' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
