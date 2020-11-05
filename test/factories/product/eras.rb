# == Schema Information
#
# Table name: product_eras
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_eras_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :product_era, class: 'Product::Era' do
    name { "MyString" }
  end
end
