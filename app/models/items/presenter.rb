class Items::Presenter
  attr_reader :item

  delegate_missing_to :item

  def initialize(item)
    @item = item
  end

  def category
    item.category.underscore.humanize
  end

  def category_underscore
    item.category.underscore
  end
end
