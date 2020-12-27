class IntakeFormSwitcherComponent < ApplicationComponent
  def initialize(item:)
    @item = item
  end

  def item_component
    "#{item_category}FormComponent".constantize.new(item: item)
  end

  private

  attr_reader :item

  def item_category
    item.category
  end

  def item_category?
    !item_category.nil?
  end
end
