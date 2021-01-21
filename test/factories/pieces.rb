# == Schema Information
#
# Table name: pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint           not null
#
# Indexes
#
#  index_pieces_on_item_id  (item_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#
FactoryBot.define do
  factory :piece do
    trait :with_one_gemstone do
      association :gemstone
      carat { 3.55 }
    end
  end
end
