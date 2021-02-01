module IconHelper
  def icon(name)
    tag.i class: icon_class_for(name)
  end

  private

  def icon_class_for(name)
    "fe fe-#{formatted_name(name)}"
  end

  def formatted_name(name)
    name.to_s.dasherize
  end
end
