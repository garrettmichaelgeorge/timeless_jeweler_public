module Lookupable
  extend ActiveSupport::Concern

  class_methods do
    def lookup_attribute(attr_name, maximum_length: 40)
      # NOTE: currently works only with arrays defined in lookup.en.yml
      validates attr_name, presence: true,
                           uniqueness: true,
                           length: { maximum: maximum_length },
                           inclusion: { in: ->(*) { lookup_values } }
    end

    def lookup_values(translator = I18n)
      translator.t(to_s.pluralize.underscore.sub('/', '_'),
                   scope: :lookup).freeze
    end
  end
end
