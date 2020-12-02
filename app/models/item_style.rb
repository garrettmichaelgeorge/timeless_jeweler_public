# == Schema Information
#
# Table name: item_styles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_item_styles_on_name  (name) UNIQUE
#

class ItemStyle < ApplicationRecord
  has_many :items, inverse_of: :style

  # Validations
  validates :name, presence: true,
                   length: { maximum: 40 },
                   uniqueness: true
end
