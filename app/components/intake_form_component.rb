class IntakeFormComponent < ApplicationComponent
  def initialize(resource:)
    @resource = resource
  end

  private

  attr_reader :resource
end
