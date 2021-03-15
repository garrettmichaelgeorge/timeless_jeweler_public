# == Schema Information
#
# Table name: metals
#
#  id                :bigint           not null, primary key
#  name              :string(40)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  metal_category_id :bigint           not null
#  metal_color_id    :bigint           not null
#  metal_purity_id   :bigint           not null
#  piece_id          :bigint           not null
#
# Indexes
#
#  index_metals_on_metal_category_id  (metal_category_id)
#  index_metals_on_metal_color_id     (metal_color_id)
#  index_metals_on_metal_purity_id    (metal_purity_id)
#  index_metals_on_name               (name) UNIQUE
#  index_metals_on_piece_id           (piece_id)
#
# Foreign Keys
#
#  fk_rails_...  (metal_category_id => metal_categories.id)
#  fk_rails_...  (metal_color_id => metal_colors.id)
#  fk_rails_...  (metal_purity_id => metal_purities.id)
#  fk_rails_...  (piece_id => pieces.id)
#

class Metal < ApplicationRecord
  belongs_to :piece,    inverse_of: :metals, class_name: 'Piece::Profile', foreign_key: 'piece_id'

  belongs_to :category, inverse_of: :metals,
                        class_name: 'Category', foreign_key: :metal_category_id

  belongs_to :color,    inverse_of: :metals,
                        class_name: 'Color', foreign_key: :metal_color_id

  belongs_to :purity,   inverse_of: :metals,
                        class_name: 'Purity', foreign_key: :metal_purity_id

  delegate :name,  to: :category, prefix: true
  delegate :name,  to: :color,    prefix: true
  delegate :value, to: :purity,   prefix: true
end
