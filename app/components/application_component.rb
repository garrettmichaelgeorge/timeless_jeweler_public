class ApplicationComponent < ViewComponent::Base
  delegate :icon, to: :helpers

  def acts_like_view_component?; end

  def link_to_add_fields(name, f, association)
    # Dynamically add nested fields to forms using js
    # http://railscasts.com/episodes/196-nested-model-form-revised?autoplay=true

    new_object = f.object.send(association).klass.new

    fields = f.simple_fields_for(association, new_object, child_index: new_object.object_id) do |builder|
      fields_component = fields_component_from(builder, association)
      render(fields_component.new(f: builder))
    end

    css_class = 'btn btn-small btn-outline-secondary add_fields'
    link_to(name, '#', class: css_class,
                       data: { id: new_object.object_id,
                               fields: fields.gsub('\n', '') })
  end

  private

  def fields_component_from(builder, association)
    (namespace_from(builder) + '::' + field_type_from(association) + 'FieldsComponent')
      .constantize
  end

  def namespace_from(builder)
    builder.template.class.to_s.gsub('Component', '')
  end

  def field_type_from(association)
    association.to_s.classify.gsub('Products', '').singularize
  end
end
