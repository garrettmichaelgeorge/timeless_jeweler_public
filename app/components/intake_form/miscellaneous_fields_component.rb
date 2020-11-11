class IntakeForm::MiscellaneousFieldsComponent < ApplicationComponent
  attr_reader :f

  def initialize(f:)
    @f = f
  end
end
