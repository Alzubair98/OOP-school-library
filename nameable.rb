class Nameable
  def correct_name
    raise NotImplementedError, 'Implemnt1'
  end
end

class BaseDecorator < Nameable
  attr_reader :nameable

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
