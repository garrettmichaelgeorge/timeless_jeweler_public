class ItemForm
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :name, :description, :notes, :style_id, :salable

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
