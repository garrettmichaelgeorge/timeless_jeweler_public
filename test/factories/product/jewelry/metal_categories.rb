# == Schema Information
#
# Table name: metal_categories
#
#  id         :bigint           not null, primary key
#  name       :string(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_categories_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :metal_category, class: 'Product::Jewelry::MetalCategory' do
    name { 'Gold' }
  end
end
