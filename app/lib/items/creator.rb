class Items::Creator
  FAILURE_MSG = 'Item was not created.'.freeze
  SUCCESS_MSG = 'Item was successfully created.'.freeze

  def self.execute(context:, item:)
    new(context).persist(item)
  end

  def initialize(context:)
    @context = context
  end

  def build_item(attrs = nil)
    return Item.new unless includes_category?(attrs)

    category = attrs.delete(:category)
    Item.build_as(category, **attrs)
  end

  def persist(item)
    if item.save
      context.create_item_succeeded item: item, msg: SUCCESS_MSG
    else
      context.create_item_failed item: item, msg: FAILURE_MSG
    end
  end

  private

  attr_reader :context, :item

  def includes_category?(attrs)
    attrs && attrs[:category]
  end
end
