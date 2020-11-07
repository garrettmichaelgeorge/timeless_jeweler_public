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
#
# Indexes
#
#  index_metals_on_jewelry_piece_id   (jewelry_piece_id)
#  index_metals_on_metal_category_id  (metal_category_id)
#  index_metals_on_name               (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (jewelry_piece_id => jewelry_pieces.id)
#  fk_rails_...  (metal_category_id => metal_categories.id)
#

FactoryBot.define do
  factory :metal, class: 'Product::Jewelry::Metal' do
    name { 'Gold' }
    association :jewelry_product
    association :category, factory: :gold
  end
end
