# == Schema Information
#
# Table name: gemstones
#
#  id         :bigint           not null, primary key
#  carat      :decimal(5, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :gemstone do
    carat { 3.05 }
  end
end
