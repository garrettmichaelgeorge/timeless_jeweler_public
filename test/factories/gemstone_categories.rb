# == Schema Information
#
# Table name: gemstone_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :gemstone_category do
    name { 'My Gemstone Category' }
  end
end
