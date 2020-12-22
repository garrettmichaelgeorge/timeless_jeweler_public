# == Schema Information
#
# Table name: gemstone_profiles
#
#  id         :bigint           not null, primary key
#  carat      :decimal(, )
#  role       :string(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :gemstone do
    carat { '9.99' }

    trait :loose do
      role { 'Loose' }
    end

    trait :mounted do
      role { 'Mounted' }
    end
  end
end
