module Salable
  extend ActiveSupport::Concern

  @@delegated_attributes = %i[name
                              description
                              notes
                              category
                              cost
                              price].freeze

  mattr_reader :delegated_attributes

  included do
    delegate(*@@delegated_attributes, to: :product)

    inverse_name = to_s.demodulize.underscore.to_sym
    belongs_to :product, inverse_of: inverse_name
  end

  class_methods do
    # def category_scope
    #   where category_name: category_name
    # end

    # def category_name
    #   to_s.demodulize.gsub('Product', '').upcase
    # end

    # def inverse_category_name
    #   to_s.demodulize.symbolize
    # end
  end
end
