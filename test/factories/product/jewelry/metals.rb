# == Schema Information
#
# Table name: metals
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metals_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :metal, aliases: [:gold],
                  class: 'Product::Jewelry::Metal' do
    name { 'Gold' }
  end
end
