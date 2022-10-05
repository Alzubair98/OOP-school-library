require_relative '../teacher_class'


describe Teacher do
  context 'check if a teacher class is created' do

    teacher = Teacher.new(30, 'Alzubair', 'Computer')

    it 'creates a teacher' do
      age = teacher.age
      name = teacher.name
      specialization = teacher.specialization
      expect(age).to eq(30)
      expect(name).to eq('Alzubair')
      expect(specialization).to eq("Computer")
    end

      it "checks if a teacher uses services" do
        services = teacher.can_use_services?
        expect(services).to be true
      end 
  end
end
