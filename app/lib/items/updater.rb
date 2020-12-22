class Items::Updater
  def self.execute(context:, item:)
    new(context).execute(item)
  end

  def initialize(context)
    @context = context
  end

  def execute(item)
    if item.update(item_params)
      msg = 'Item was successfully updated.'
      context.update_item_succeeded(item, msg)
    else
      msg = 'Item was not updated.'
      context.update_item_failed(item, msg)
    end
  end

  private

  attr_reader :context
end
