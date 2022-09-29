require './book'
require './person_class'
require './student_class'
require './teacher_class'
require './rental'

$books = []
$students = []
$teachers = []
$rental = []
$people = []

def sort_books
  if $books.empty?
    puts 'There is no books :('
  else
    puts 'Here is the Books :)'
    $books.each { |b| puts "Title: #{b.title}, Author:#{b.author}" }
  end
end

def sort_people
  if !$students.empty? || !$teachers.empty?
    $students.each { |s| puts "Student name: #{s.name}, ID: #{s.id}, AGE:#{s.age}" }
    $teachers.each { |t| puts "Teacher name: #{t.name}, ID: #{t.id}, AGE:#{t.age}" }
  else
    puts 'there is no one here :('
  end
end

def add_student(classroom, age, name, parent_permission: true)
  $students << Student.new(classroom, age, name, parent_permission)
end

def add_teacher(name, age, specialization)
  $teachers << Teacher.new(name, age, specialization)
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
      add_student(classroom = 1, age = s_age, name = s_name)
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
    add_teacher(name = t_name, age = t_age, specialization = t_specialization)
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

def book_list
  puts 'Choose a book from the list:-'
  i = 0
  while i < $books.length
    puts "#{i + 1}- Title: #{$books[i].title} Author: #{$books[i].author}"
    i += 1
  end
end

def people_list
  puts 'Choose a person from the list by number:-'
  i = 0
  while i < $people.length
    puts "#{i + 1}- Name: #{$people[i].name} ID: #{$people[i].id}, Age: #{$people[i].age}"
    i += 1
  end
end

def create_rental
  $people.concat($students)
  $people.concat($teachers)

  puts 'You are going to create a rental'

  print 'Please enter a date'
  d_rental = gets.chomp

  people_list
  p_rental = gets.chomp.to_i

  book_list
  b_rental = gets.chomp.to_i

  $rental << Rental.new(date = d_rental, person = p_rental, book = b_rental)
  puts 'Rental Created'
end

def rental_by_id
  if $people.empty?
    puts 'there is no one to look for'
  else
    print 'Enter Person ID: '
    id = gets.chomp.to_i
    $rental.each do |r|
      puts "Date: #{r.date}, book: #{r.book.title}," if r.person.id == id
    end
  end
end
