require_relative '../student_class'

describe Student do
  context 'check if a student class is created' do
    it 'creates a student' do
      student = Student.new('CR1', 18, 'Abraha', true)
      classroom = student.classroom
      age = student.age
      name = student.name
      parent_permission = student.parent_permission
      expect(classroom).to eq('CR1')
      expect(age).to eq(18)
      expect(name).to eq('Abraha')
      expect(parent_permission).to be true
      
      # test the method
      play = student.play_hooky
      expect(play).to eq("¯\(ツ)/¯")
    end

  end

end

