module Items
  class Creator
    attr_reader :context, :attrs, :item_class, :translator
    attr_writer :item

    def initialize(context:, attrs: {}, item_class: Item, translator: I18n)
      @context = context
      @attrs = attrs
      @item_class = item_class
      @translator = translator
    end

    def create!
      if item.save
        context.create_item_succeeded(item: item, msg: success_msg(item))
      else
        context.create_item_failed(item: item, msg: failure_msg(item))
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
      item_class.new(user: current_user, **attrs)
    end

    def current_user
      context.current_user
    end

    def success_msg(record)
      lookup = 'activerecord.user_defined.errors.messages.create_record_succeeded'
      translator.t(lookup, record: record.class.to_s)
    end

    def failure_msg(record)
      lookup = 'activerecord.user_defined.errors.messages.create_record_failed'
      translator.t(lookup, record: record.class.to_s)
    end
  end
end
