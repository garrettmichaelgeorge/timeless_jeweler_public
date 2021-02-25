module Intakable
  extend ActiveSupport::Concern

  included do
    before_reflex do
      @item ||= build_item
      # @item.assign_attributes(item_params)
    end
  end

  private

  def build_item(**attrs)
    Items::Creator.new(context: self, attrs: attrs)
                  .item
  end

  def item_params 
    item_guard.protect
  end

  def item_guard
    @item_guard ||= Items::Guard.new(context: self)
  end
end
