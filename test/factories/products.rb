FactoryBot.define do
  factory :product do
    name { 'Small ring' }
    association :category, factory: :product_category
    association :style, factory: :product_style
  end
end
