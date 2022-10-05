require_relative '../classroom'

describe Classroom do
  context 'check classroom class' do
    it 'create new classroom' do
      classroom = Classroom.new('1')
      label = classroom.label
      expect(label).to eq('1')
    end
  end
end
