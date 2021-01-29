class Items::Presenter
  attr_reader :item

  delegate :categories, to: :class

  delegate_missing_to :item

  def initialize(item)
    @item = item
  end

  def category = category_underscore.humanize

  def category_underscore = item.category.underscore

  class << self
    def categories = item.categories.map { |cat| humanize_category(cat) }

    def humanize_category(cat) = cat.underscore.humanize
  end
end
