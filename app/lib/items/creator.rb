class Items::Creator
  def self.execute(context:, item:)
    new(context).execute(item)
  end

  def initialize(context)
    @context = context
  end

  def persist(item)
    if item.save
      msg = 'Item was successfully created.'
      context.create_item_succeeded item, msg
    else
      msg = 'Item was not created.'
      context.create_item_failed item, msg
    end
  end

  def build_item(**args)
    category = args.delete(:category)
    Item.build_as(category, **args)
  end

  alias execute persist

  private

  attr_reader :context, :item
end
