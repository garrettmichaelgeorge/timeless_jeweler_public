FactoryBot.define do
  factory :product_style, aliases: [:art_deco],
                          class: Product::Style do
    name { 'Art Deco' }
  end
end
