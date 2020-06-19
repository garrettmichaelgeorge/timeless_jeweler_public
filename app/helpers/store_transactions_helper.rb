module StoreTransactionsHelper
  def category_name_capitalized
    "#{@store_transaction.category.name.capitalize}"
  end

  def product_name_with_price
    "#{self.product.name}: #{self.product.price}"
  end
end
