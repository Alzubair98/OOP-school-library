require './Person.rb'

class Student < Person
    def initialize(classroom,age, name, parent_permission)
        super(age, name, parent_permission)
        @classroom = classroom
        

    def play_hooky
        "¯\(ツ)/¯"
    end
end