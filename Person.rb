class Person
    attr_accessor :name
    attr_accessor :age
    attr_reader :id

    def initialize(name = 'unknown', age, parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    end

        private

    def is_of_age?
    return @age > 18 ? true : false
    end

        public

    def can_use_services?
    if is_of_age?
        true
    elsif parent_permission
        true
    else
        false
    end
end 