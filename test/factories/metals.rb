# == Schema Information
#
# Table name: metals
#
#  id                :bigint           not null, primary key
#  name              :string(40)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  jewelry_piece_id  :bigint           not null
#  metal_category_id :bigint           not null
#  metal_color_id    :bigint           not null
#  metal_purity_id   :bigint           not null
#
# Indexes
#
#  index_metals_on_jewelry_piece_id   (jewelry_piece_id)
#  index_metals_on_metal_category_id  (metal_category_id)
#  index_metals_on_metal_color_id     (metal_color_id)
#  index_metals_on_metal_purity_id    (metal_purity_id)
#  index_metals_on_name               (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (jewelry_piece_id => pieces.id)
#  fk_rails_...  (metal_category_id => metal_categories.id)
#  fk_rails_...  (metal_color_id => metal_colors.id)
#  fk_rails_...  (metal_purity_id => metal_purities.id)
#

FactoryBot.define do
  factory :metal do
    association :piece
    association :category, factory: :metal_category
    association :color, factory: :metal_color
    association :purity, factory: :metal_purity
  end
end
