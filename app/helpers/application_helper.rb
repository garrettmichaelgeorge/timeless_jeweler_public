module ApplicationHelper
  def self.flash_class(level)
    case level.to_sym
    when :notice then 'alert alert-success alert-dismissable fade show'
    when :success then 'alert alert-success alert-dismissable fade show'
    when :error then 'alert alert-danger alert-dismissable fade show'
    when :alert then 'alert alert-danger alert-dismissable fade show'
    end
  end

  def self.flash_icon(level)
    case level.to_sym
    when :notice then 'fe fe-alert-circle'
    when :success then 'fe fe-check-square'
    when :error then 'fe fe-alert-triangle'
    when :alert then 'fe fe-alert-octagon'
    end
  end

  def category_name_capitalized
    self.category.name.capitalize
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to name, '#', class: 'add_fields', data: { id: id, fields: fields.gsub('\n', '') }
  end
end
