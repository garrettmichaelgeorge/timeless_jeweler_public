# == Schema Information
#
# Table name: email_addresses
#
#  id             :bigint           not null, primary key
#  email_address  :string
#  emailable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  emailable_id   :bigint           not null
#
# Indexes
#
#  index_email_addresses_on_emailable_type_and_emailable_id  (emailable_type,emailable_id)
#
FactoryBot.define do
  factory :email_address do
    for_person

    email_address { 'garrett.dev@example.com' }
  end

  trait :for_person do
    association :emailable, factory: :person
  end
end
