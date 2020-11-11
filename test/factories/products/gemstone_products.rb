# == Schema Information
#
# Table name: loose_gemstones
#
#  gemstone_id :bigint           not null
#  product_id  :bigint           not null
#
# Indexes
#
#  index_loose_gemstones_on_gemstone_id  (gemstone_id)
#  index_loose_gemstones_on_product_id   (product_id)
#
FactoryBot.define do
  factory :gemstone_product, class: 'Product::Gemstone' do
    association :gemstone
    association :product, :gemstone
  end
end
