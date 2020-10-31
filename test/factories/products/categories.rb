FactoryBot.define do
  factory :product_category, aliases: [:product_category_jewelry],
                             class: Product::Category do
    name { 'JEWELRY' }
  end

  factory :product_category_gemstone, class: Product::Category do
    name { 'GEMSTONE' }
  end

  factory :product_category_miscellaneous, class: Product::Category do
    name { 'MISCELLANEOUS' }
  end
end
