module ProductsHelper
  def name_with_price
    "#{self.name} (#{self.price.class})"
  end

  def self.handle_blank_field(value)
    value.blank? ? ' '.html_safe : value
  end

  def self.display_category_for(product)
    handle_blank_field(product.category_name).capitalize
  end
end
