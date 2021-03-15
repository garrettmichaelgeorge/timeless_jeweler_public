module Lookupable
  extend ActiveSupport::Concern

  included do
    delegate :lookup_table?, :lookupable?, to: :class
  end

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

    def lookup_table?
      true
    end
    alias_method :lookupable?, :lookup_table?
  end
end
