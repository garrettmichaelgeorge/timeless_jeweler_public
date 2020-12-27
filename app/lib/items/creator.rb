class Items::Creator
  def self.execute(context:, item:)
    new(context).persist(item)
  end

  def initialize(context:)
    @context = context
  end

  def build_item(attrs = nil)
    return Item.new unless attrs && attrs[:category]

    category = attrs.delete(:category)
    Item.build_as(category, **attrs)
  end

  def persist(item)
    if item.save
      msg = 'Item was successfully created.'
      context.create_item_succeeded item: item, msg: msg
    else
      msg = 'Item was not created.'
      context.create_item_failed item: item, msg: msg
    end
  end

  private

  attr_reader :context, :item
end
