class ItemValidator
  include ActiveModel::Validations

  def self.validate(item)
    new(item).validate
  end

  # validates :name, presence: true

  def initialize(item)
    @name = item.name
  end

  private

  attr_reader :name
end
