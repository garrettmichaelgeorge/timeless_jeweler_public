class IntakeForm
  include ActiveModel::Model

  attr_reader :name, :description, :notes, :style_id, :category,
              :piece_attributes, :gemstone_attributes

  def persisted?
    false
  end

  def save
    return false unless valid?

    persist!
    true
  end

  private

  def persist!
    @item = Item.create!(name: item_name)
  end
end
