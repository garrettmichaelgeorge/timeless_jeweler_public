class Items::Creator
  def self.execute(context:, item:)
    new(context).persist(item)
  end

  def initialize(context)
    @context = context
  end

  def build_item(**args)
    category = args.delete(:category)
    if category
      Item.build_as(category, **args)
    else
      Item.new
    end
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
