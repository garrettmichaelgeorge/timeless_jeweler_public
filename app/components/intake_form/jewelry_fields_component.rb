class IntakeForm::JewelryFieldsComponent < ApplicationComponent
  def initialize(resource:, f:)
    @resource = resource
    @f = f
  end

  private

  attr_reader :resource, :f
end
