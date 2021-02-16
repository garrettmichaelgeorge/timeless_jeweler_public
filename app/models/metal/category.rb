# == Schema Information
#
# Table name: metal_categories
#
#  id         :bigint           not null, primary key
#  name       :string(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_categories_on_name  (name) UNIQUE
#

class Metal
  class Category < ApplicationRecord
    # This is a lookup class

    include Lookupable

    # Associations
    has_many :metals, inverse_of: :category

    # Validations
    lookup_attribute :name, maximum_length: 20
  end
end
