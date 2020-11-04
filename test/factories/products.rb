# == Schema Information
#
# Table name: products
#
#  id               :bigint           not null, primary key
#  category         :string(20)
#  cost_cents       :integer          default(0), not null
#  cost_currency    :string           default("USD"), not null
#  description      :text
#  name             :string(40)       not null
#  notes            :text
#  price_cents      :integer          default(0), not null
#  price_currency   :string           default("USD"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_style_id :bigint           not null
#
# Indexes
#
#  index_products_on_product_style_id  (product_style_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_style_id => product_styles.id)
#
FactoryBot.define do
  factory :product do
    name { 'Small ring' }
    description { 'Lorem ipsum sic dolor amet.' }
    association :style, factory: :product_style
    jewelry

    trait :jewelry do
      category { 'JEWELRY' }
    end

    trait :gemstone do
      category { 'GEMSTONE' }
    end

    trait :miscellaneous do
      category { 'MISCELLANEOUS' }
    end
  end
end
