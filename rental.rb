class Rental
  attr_accessor :book, :date, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    book.rental << self

    @person = person
    person.rental << self
  end
end
