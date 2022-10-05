require './book'
require './person_class'
require './student_class'
require './teacher_class'
require './rental'
require 'json'

if File.exist?('books.json')
  $books = if File.zero?('books.json')
             []
           else
             JSON.parse(File.read('books.json'))
           end
else
  puts 'There is no books file , maybe you need to create one'
end
$students = []
$teachers = []
if File.exist?('people.json')
  $people = if File.zero?('people.json')
              []
            else
              JSON.parse(File.read('people.json'))
            end
else
  puts 'There is no people file , maybe you need to create one'
end

if File.exist?('rentals.json')
  $rental = if File.zero?('rentals.json')
              []
            else
              JSON.parse(File.read('rentals.json'))
            end
else
  puts 'There is no rentals file , maybe you need to create one'
end

def sort_books
  if $books.empty?
    puts 'There is no books :('
  else
    puts 'Here is the Books :)'
    $books.each { |b| b.each { |k, v| puts "#{k}: #{v}" } }
  end
end

def sort_people
  if $people.empty?
    puts 'there is no one here :('
  else
    $people.each { |p| p.each { |k, v| puts "#{k}: #{v}" } }
    # if !$students.empty? || !$teachers.empty?
    #   $students.each { |s| puts "Student name: #{s.name}, ID: #{s.id}, AGE:#{s.age}" }
    #   $teachers.each { |t| puts "Teacher name: #{t.name}, ID: #{t.id}, AGE:#{t.age}" }
  end
end

def add_student(classroom, age, name, parent_permission)
  $students << Student.new(classroom, age, name, parent_permission)
end

def add_teacher(age, name, specialization)
  $teachers << Teacher.new(age, name, specialization)
end

def create_person
  puts 'to create student press 1 , teacher 2 '
  choice = gets.chomp
  case choice.to_i
  when 1
    print "Enter student's name: "
    s_name = gets.chomp
    print 'Enter Age: '
    s_age = gets.chomp
    print 'Has parent permission? [y/n]'
    p_student = gets.chomp
    case p_student.downcase
    when 'y'
      add_student(classroom = 1, age = s_age, name = s_name, parent_permission = true)
      puts 'Student created :)'
    when 'n'
      add_student(classroom = 1, age = s_age, name = s_name, parent_permission = false)
      puts 'Student created :)'
    else
      puts "wrong syntax: #{p_student}"
    end
  when 2
    print "Enter Teacher's name: "
    t_name = gets.chomp
    print 'Enter Age: '
    t_age = gets.chomp
    print 'Enter specialization: '
    t_specialization = gets.chomp
    add_teacher(t_age, t_name, specialization = t_specialization)
    puts 'Teacher created :)'
  else
    puts 'You have enterd invalid number :('
  end
end

def create_book
  puts 'You are going to create a book'
  print 'Please enter book title: '
  b_title = gets.chomp
  print 'Please enter author name: '
  b_author = gets.chomp
  $books << Book.new(title = b_title, author = b_author)
  puts 'Book Created :)'
end

def add_book_to_file
  books_list = []
  $books.each do |b|
    books_list << if b.instance_of?(Hash)
                    b
                  else
                    { title: b.title, author: b.author }
                  end
  end
  File.write('books.json', JSON.pretty_generate(books_list))
end

def book_list
  puts 'Choose a book from the list:-'
  i = 0
  while i < $books.length
    puts "#{i + 1}- Title: #{$books[i]['title']} Author: #{$books[i]['author']}"
    i += 1
  end
end

def people_list
  puts 'Choose a person from the list by number:-'
  i = 0
  while i < $people.length
    puts "#{i + 1}- Name: #{$people[i]['name']} ID: #{$people[i]['id']}, Age: #{$people[i]['age']}"
    i += 1
  end
end

def add_people_to_file
  ($people.concat $students)
  ($people.concat $teachers)
  people_list = []
  $people.each do |p|
    people_list << if p.instance_of?(Hash)
                     p
                   else
                     { name: p.name, id: p.id, age: p.age }
                   end
  end
  File.write('people.json', JSON.pretty_generate(people_list))
end

def create_rental
  ($people.concat $students)
  ($people.concat $teachers)

  puts 'You are going to create a rental'

  print 'Please enter a date: '
  date_rental = gets.chomp

  people_list
  person_rental = gets.chomp.to_i

  book_list
  book_rental = gets.chomp.to_i

  r_person = $people[person_rental - 1]
  r_book = $books[book_rental - 1]

  $rental << Rental.new(date_rental, r_person, r_book)
  puts 'Rental Created'
end

def add_rentals_to_file
  rentals_list = []
  $rental.each do |r|
    rentals_list << if r.instance_of?(Hash)
                      r
                    else
                      { date: r.date, id: r.person['id'], title: r.book['title'], name: r.person['name'] }
                    end
  end
  File.write('rentals.json', JSON.pretty_generate(rentals_list))
end

def rental_by_id
  if $rental.empty?
    puts 'there is no one to look for'
  else
    people_list
    print 'Enter Person ID: '
    id = gets.chomp.to_i
    $rental.each do |r|
      if r['id'] == id
        puts " #{r['name'].capitalize} has the following rentals:-
      Date: #{r['date']}, book: #{r['title']}.\n"
      else
        puts 'it seems like you entered wrong id'
      end
    end
  end
end
