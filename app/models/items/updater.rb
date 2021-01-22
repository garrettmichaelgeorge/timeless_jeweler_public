class Items::Updater
  def initialize(context:, item:, attrs:)
    @context = context
    @item = item
    @attrs = attrs
  end

  def update
    if item.update(attrs)
      context.update_item_succeeded(item: item)
    else
      context.update_item_failed(item: item)
    end
  end

  private

  attr_reader :context, :item, :attrs
end
