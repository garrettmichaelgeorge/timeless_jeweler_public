class Items::Destroyer
  def initialize(context:)
    @context = context
  end

  def destroy_item(item:)
    if item.destroy
      msg = 'Item was successfully deleted.'
      context.destroy_item_succeeded(msg: msg)
    else
      msg = 'Item was not able to be deleted.'
      context.destroy_item_failed(msg: msg)
    end
  end

  private

  attr_reader :context
end
