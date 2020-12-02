module ItemsHelper
  def name_with_price
    "#{name} (#{price.class})"
  end

  def self.handle_blank_field(value)
    value.blank? ? ' '.html_safe : value
  end

  def self.display_category_for(item)
    handle_blank_field(item.category_name).capitalize
  end
end
