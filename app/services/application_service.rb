# frozen_string_literal: true
class ApplicationService
  def initialize
    raise NotImplementedError, "(ApplicationService is an abstract class and cannot be instantiated.)"
  end

  def self.call(*args, &block)
    new(*args, &block).call
  end
end
