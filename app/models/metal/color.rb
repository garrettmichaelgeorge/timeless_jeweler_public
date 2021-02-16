# == Schema Information
#
# Table name: metal_colors
#
#  id         :bigint           not null, primary key
#  name       :string(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_colors_on_name  (name) UNIQUE
#

class Metal
  class Color < ApplicationRecord
    # This is a lookup class
    self.table_name = 'metal_colors'

    ALLOWED_VALUES = I18n.t('metal_colors', scope: :lookup).freeze

    # Associations
    has_many :metals, inverse_of: :color

    # Validations
    validates :name, presence: true,
                     uniqueness: true,
                     length: { maximum: 10 },
                     inclusion: { in: ALLOWED_VALUES }
  end
end
