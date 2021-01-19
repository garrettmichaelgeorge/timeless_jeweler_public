# == Schema Information
#
# Table name: merchants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_merchants_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :merchant do
    name { 'My Merchant' }
  end
end
