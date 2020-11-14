# frozen_string_literal: true

require 'active_support/core_ext/string/inquiry'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    # from Rails 6.1 feature Delegated Type
    # documented here: https://github.com/rails/rails/pull/39341
    def delegated_type(role, types:, **options)
      belongs_to role, options.delete(:scope), **options.merge(polymorphic: true)
      define_delegated_type_methods role, types: types
    end

    private

    def define_delegated_type_methods(role, types:)
      role_type = "#{role}_type"
      role_id   = "#{role}_id"

      define_method "#{role}_class" do
        public_send("#{role}_type").constantize
      end

      define_method "#{role}_name" do
        public_send("#{role}_class").model_name.singular.inquiry
      end

      types.each do |type|
        scope_name = type.tableize.gsub('/', '_')
        singular   = scope_name.singularize
        query      = "#{singular}?"

        scope scope_name, -> { where(role_type => type) }

        define_method query do
          public_send(role_type) == type
        end

        define_method singular do
          public_send(role) if public_send(query)
        end

        define_method "#{singular}_id" do
          public_send(role_id) if public_send(query)
        end
      end
    end
  end
end
