module IconHelper
  def icon(name)
    tag.i class: icon_class_for(name)
  end

  private

  def icon_class_for(name)
    class_names 'fe', icon_name(name)
  end

  def icon_name(name)
    "fe-#{name.to_s.dasherize}"
  end
end
