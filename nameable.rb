class Nameable
  def correct_name
    raise NotImplementedError, 'Implement!!'
  end
end

class BaseDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.length <= 10 ? @nameable.correct_name : @nameable.correct_name.slice(0, 10)
  end
end
