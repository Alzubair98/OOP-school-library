class Rental
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end

  def book=(book)
    @book = book
    @book.rental << self unless book.rental.include?(slef)
  end

  def person=(person)
    @person = person
    person.rental << self unless person.rental.include?(slef)
  end
end
