FactoryBot.define do
  factory :jewelry_product, class: Product::JewelryProduct do
    association :product, :jewelry, name: 'Small ring'
  end
end
