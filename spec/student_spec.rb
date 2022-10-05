require_relative '../student_class'

describe Student do
  context 'check if a student class is created' do

    student = Student.new('CR1', 18, 'Abraha', true)

    it 'creates a student' do
      classroom = student.classroom
      age = student.age
      name = student.name
      parent_permission = student.parent_permission
      expect(classroom).to eq('CR1')
      expect(age).to eq(18)
      expect(name).to eq('Abraha')
      expect(parent_permission).to be true
    end

    it "checks for a student wheather it plays hooky" do
      play = student.play_hooky
      expect(play).to eq("¯\(ツ)/¯")
    end

  end

end

