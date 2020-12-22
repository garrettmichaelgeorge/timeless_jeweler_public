class IntakeFormSwitcherComponent < ApplicationComponent
  def initialize(item:)
    @item = item
  end

  def call_piece
    'Hello piece!'
  end

  def call_gemstone
    'Hello gemstone!'
  end

  def call_miscellaneous
    'Hello miscellaneous!'
  end

  def call
    render "#{item_category}FormComponent".constantize.new(item: item)
  end

  private

  attr_reader :item

  def item_category
    item.category
  end
end
