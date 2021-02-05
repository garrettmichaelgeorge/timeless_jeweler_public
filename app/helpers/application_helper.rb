module ApplicationHelper
  def category_name_capitalized
    category.name.capitalize
  end

  def page_title(local_title:)
    "#{app_title} - #{local_title}"
  end

  def app_title(framework = Rails)
    framework.app_class.to_s.deconstantize.underscore.humanize.titleize
  end
end
