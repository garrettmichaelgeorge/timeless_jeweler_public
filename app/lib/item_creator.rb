class ItemCreator
  def initialize(context)
    @context = context
    @repo = context.repo
  end

  def execute(attributes)
    item = Item.new(attributes)

    if item.save
      msg = 'Item was successfully added to inventory'
      context.create_item_successful(item, msg)
    else
      msg = 'Item was not added.'
      context.create_item_failed(item, msg)
    end
  end
end
