# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  category       :string(20)
#  cost_cents     :integer          default(0), not null
#  cost_currency  :string           default("USD"), not null
#  description    :text
#  name           :string(40)       not null
#  notes          :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_style_id  :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#  index_items_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :item do
    name { 'Small ring' }
    description { 'Lorem ipsum sic dolor amet.' }
    association :style, factory: :item_style
    association :user

    trait :as_piece do
      category { 'Piece' }
    end

    trait :piece do :as_piece end

    trait :as_gemstone do
      category { 'Gemstone' }
    end

    trait :gemstone do :as_gemstone end

    trait :as_miscellaneous_item do
      category { 'MiscellaneousItem' }
    end

    trait :miscellaneous_item do :as_miscellaneous_item end
  end
end
