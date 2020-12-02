module FormHelper
  def setup_item(item)
    item.jewelry_item       ||= Piece.new
    item.gemstone_item      ||= Gemstone.new
    item.miscellaneous_item ||= MiscellaneousItem.new

    item
  end
end
