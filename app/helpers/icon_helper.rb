module IconHelper
  CUSTOM_MAPPINGS = {
    piece: :watch,
    loose_gemstone: :square,
    miscellaneous_item: :shopping_bag,
    notice: :alert_circle,
    success: :check_square,
    error: :alert_triangle,
    alert: :alert_octagon
  }

  def icon_for(custom_name)
    icon(custom_icon_name(custom_name))
  end

  def icon(name)
    tag.i class: icon_class_for(name)
  end

  private

  def custom_icon_name(custom_name)
    CUSTOM_MAPPINGS.fetch(formatted_custom_icon_name(custom_name)) { '' }
  end

  def formatted_custom_icon_name(custom_name)
    custom_name.to_s.underscore.to_sym
  end

  def icon_class_for(name)
    class_names base_class, modifier_class(name)
  end

  def base_class
    'fe'
  end

  def modifier_class(name)
    "fe-#{formatted_icon_name(name)}"
  end

  def formatted_icon_name(name)
    name.to_s.dasherize
  end
end
