class Items::PiecePresenter
  def initialize(item)
    @item = item
  end

  private

  attr_reader :item
end
