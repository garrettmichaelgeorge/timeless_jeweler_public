class Items::Repo
  def find_all_items
    Item.includes(:style).all
  end

  def find_item(id)
    Item.find(id)
  end
end
