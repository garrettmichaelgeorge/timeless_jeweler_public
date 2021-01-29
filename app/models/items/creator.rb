module Items
  class Creator
    attr_reader :context, :attrs, :record_class
    attr_writer :item

    def initialize(context:, attrs: {}, record_class: Item)
      @context = context
      @attrs = attrs
      @record_class = record_class
    end

    def create!
      if item.save
        context.create_item_succeeded(item: item)
      else
        context.create_item_failed(item: item)
      end
    end

    def reset!
      self.item = nil
    end

    def item
      @item ||= build(record_class)
    end

    private

    def build(record_class)
      record_class.new(user: current_user, **attrs)
    end

    def current_user
      context.current_user
    end
  end
end
