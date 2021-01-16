class Items::Creator
  FAILURE_MSG = 'Item was not created.'.freeze
  SUCCESS_MSG = 'Item was successfully created.'.freeze

  attr_reader :context, :attrs, :item_class
  attr_writer :item

  def initialize(context:, attrs: {}, item_class: Item)
    @context = context
    @attrs = attrs
    @item_class = item_class
  end

  def persist!
    if item.save
      context.create_item_succeeded(item: item, msg: SUCCESS_MSG)
    else
      context.create_item_failed(item: item, msg: FAILURE_MSG)
    end
    reset!
  end

  def reset!
    item = nil
  end

  def item
    @item ||= build_item(item_class: item_class, **attrs)
  end

  private

  def build_item(item_class:, **attrs)
    if attrs.empty?
      item_class.new
    else
      item_class.build_as(attrs[:category], **attrs.except(:category))
    end
  end
end
