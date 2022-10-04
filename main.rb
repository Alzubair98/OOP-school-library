require './app'

def main
  puts "\nWELCOME TO OUR SCHOOL LIBRARY \n"
  button = true
  while button
    puts ' '
    puts 'please choose an option:-
        1- List all books
        2- List all people
        3- Create a person
        4- Create a book
        5- Create a rental
        6- List all rentals for a person by their own id
        7- Exit
        '
    choice = gets.chomp.to_i
    case choice
    when 1 then sort_books
    when 2 then sort_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then rental_by_id
    when 7
      add_book_to_file
      add_people_to_file
      add_rentals_to_file
      puts 'See you later'
      button = false
    else
      puts 'no such option ;('
    end
  end
end

main
