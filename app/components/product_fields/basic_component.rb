class ProductFields::BasicComponent < ApplicationComponent
  def initialize(f:)
    @f = f
  end

  private

  attr_reader :f
end
