require './Person'

class Teacher < Person
  def initialize(name, age, specialization, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
