# frozen_string_literal: true

class SKUReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #   - reflex_id - a UUIDv4 that uniquely identies each Reflex
  #   - flash - the ActionDispatch::Flash::FlashHash for the current request

  before_reflex do
    throw :abort unless item_params[:category] == 'Piece'

    @item ||= Items::Creator.new(context: self, attrs: item_params).item
    @item.assign_attributes(item_params)
  end

  def update
    morph '#sku-preview', render(Intake::SKUComponent.new(sku: @item.sku))
  end

  private

  def item_params
    Items::Guard.new(context: self).protect
  end
end
