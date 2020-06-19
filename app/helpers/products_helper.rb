module ProductsHelper
  def name_with_price
    "#{self.name} (#{self.price.class})"
  end
end
