# == Schema Information
#
# Table name: pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :piece do
    # association :product, :jewelry, name: 'Small ring'

    trait :with_one_gemstone do
      association :gemstone
      carat { 3.55 }
    end
  end
end
