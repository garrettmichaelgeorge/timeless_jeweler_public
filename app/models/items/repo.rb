class Items::Repo
  attr_reader :context

  def initialize(context:)
    @context = context
  end

  def find_all_items
    current_user.items
  end

  def find_item(id)
    find_all_items.find(id)
  end

  private

  def current_user
    context.current_user
  end
end
