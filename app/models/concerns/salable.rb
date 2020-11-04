module Salable
  extend ActiveSupport::Concern

  @@delegated_attributes = %i[name
                              description
                              notes
                              cost
                              price].freeze

  mattr_reader :delegated_attributes

  included do
    delegate(*@@delegated_attributes, to: :product)
    # or...
    # delegate_missing_to :product

    case to_s.demodulize.gsub('Product', '').upcase
    when 'JEWELRY'
      belongs_to :product, -> { jewelry },
                 inverse_of: :jewelry_product
    when 'MISCELLANEOUS'
      belongs_to :product, -> { miscellaneous },
                 inverse_of: :miscellaneous_product
    when 'GEMSTONE'
      belongs_to :product, -> { gemstone },
                 inverse_of: :gemstone_product
    end
  end

  class_methods do
    def category_scope
      where category_name: category_name
    end

    def category_name
      to_s.demodulize.gsub('Product', '').upcase
    end

    def inverse_category_name
      to_s.demodulize.symbolize
    end
  end
end
