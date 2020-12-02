# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  cost_cents     :integer          default(0), not null
#  cost_currency  :string           default("USD"), not null
#  description    :text
#  name           :string(40)       not null
#  notes          :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  salable_type   :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_style_id  :bigint           not null
#  salable_id     :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#  index_products_on_salable     (salable_type,salable_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#

FactoryBot.define do
  factory :item do
    name { 'Small ring' }
    description { 'Lorem ipsum sic dolor amet.' }
    association :style, factory: :item_style

    trait :jewelry do
      salable { 'Jewelry' }
    end

    trait :gemstone do
      salable { 'Gemstone' }
      carat { 3.55 }
    end

    trait :miscellaneous do
      salable { 'MiscellaneousItem' }
    end
  end
end
