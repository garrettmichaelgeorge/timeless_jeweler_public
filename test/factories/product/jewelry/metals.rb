# == Schema Information
#
# Table name: metals
#
#  id               :bigint           not null, primary key
#  name             :string(40)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  jewelry_piece_id :bigint           not null
#
# Indexes
#
#  index_metals_on_jewelry_piece_id  (jewelry_piece_id)
#  index_metals_on_name              (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (jewelry_piece_id => jewelry_pieces.id)
#
FactoryBot.define do
  factory :metal, aliases: [:gold],
                  class: 'Product::Jewelry::Metal' do
    name { 'Gold' }
  end
end
