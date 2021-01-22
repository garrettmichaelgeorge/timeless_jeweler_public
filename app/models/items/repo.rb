class Items::Repo
  attr_reader :context, :model

  def initialize(context:, model: Item)
    @context = context
    @model = model
  end

  def find_all_items
    model.with_styles
         .for_user(current_user)
  end

  def find_item(id)
    find_all_items.find(id)
  end

  private

  def current_user
    context.current_user
  end
end
