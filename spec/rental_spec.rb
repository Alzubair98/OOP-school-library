require_relative '../rental'

describe Rental do
  context 'check the rental class' do
    it 'create new rental' do
      rental = Rental.new(2022, 'ahmed', 'book1')
      expect(rental.date).to eq(2022)
      expect(rental.person).to eq('ahmed')
      expect(rental.book).to eq('book1')
    end
  end
end
