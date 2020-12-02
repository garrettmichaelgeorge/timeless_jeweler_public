class ProductFields::BasicComponent < ApplicationComponent
  attr_reader :f

  def initialize(f:)
    @f = f
  end
end
