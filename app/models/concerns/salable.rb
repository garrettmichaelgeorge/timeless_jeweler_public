module Salable
  extend ActiveSupport::Concern

  TYPES = %w[Piece Gemstone MiscellaneousItem].freeze

  included do
    has_one :item, as: :salable, touch: true
  end
end
