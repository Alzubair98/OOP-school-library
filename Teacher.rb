require './Person.rb'

class Teacher < Person
    def initialize(name, age, specialization, parent_permission= true)
        super(name, age, parent_permission)
        @specialization = specialization
    end

    def can_use_services?
        return true
    end
end