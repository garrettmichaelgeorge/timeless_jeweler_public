# == Schema Information
#
# Table name: piece_subcategories
#
#  id         :bigint           not null, primary key
#  code       :string(1)
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_piece_subcategories_on_code  (code) UNIQUE
#  index_piece_subcategories_on_name  (name) UNIQUE
#

class Piece
  class Subcategory < ApplicationRecord
    self.table_name = 'piece_subcategories'

    has_many :pieces, inverse_of: :subcategory, class_name: 'Piece::Profile'

    validates :code, presence: true,
                     uniqueness: true,
                     length: { maximum: 1 }

    validates :name, presence: true,
                     uniqueness: true,
                     length: { maximum: 40 }
  end
end
