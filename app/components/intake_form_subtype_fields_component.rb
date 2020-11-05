class IntakeFormSubtypeFieldsComponent < ApplicationComponent
  attr_reader :resource, :f

  def initialize(resource:, f:)
    @resource = resource
    @f = f
  end

  def call
    'Hello, world!'
  end

  def call_jewelry
    'Hello, jewelry!'
  end

  def call_gemstone
    'Hello, jewelry!'
  end

  def call_miscellaneous
    'Hello, jewelry!'
  end
end
