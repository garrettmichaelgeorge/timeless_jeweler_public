module StoreTransactionsHelper
  def category_name_capitalized
    "#{@store_transaction.category.name.capitalize}"
  end
end
