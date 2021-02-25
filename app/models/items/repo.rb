class Items::Repo
  attr_reader :context, :model_class

  def initialize(context:, model_class: Item)
    @context = context
    @model_class = model_class
  end

  def find_all_items
    model_class.for_user(current_user)
               .includes(:profile)
  end

  def find_item(id)
    find_all_items.find(id)
  end

  private

  def current_user
    context.current_user
  end
end
