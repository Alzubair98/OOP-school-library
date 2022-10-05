require_relative '../teacher_class'


describe Teacher do
  context 'check if a teacher class is created' do
    it 'creates a teacher' do
      teacher = Teacher.new(30, 'Alzubair', 'Computer')
      age = teacher.age
      name = teacher.name
      specialization = teacher.specialization
      expect(age).to eq(30)
      expect(name).to eq('Alzubair')
      expect(specialization).to eq("Computer")

      #test the method
      services = teacher.can_use_services?
      expect(services).to be true
    end
  end
end
