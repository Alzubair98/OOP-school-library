class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end

  def book=(book)
    @book = book
    @book.rental << self unless book.rental.include?(self)
  end

  def person=(_person)
    @book = book
    @book.rental << self unless book.rental.include?(self)
  end
end
