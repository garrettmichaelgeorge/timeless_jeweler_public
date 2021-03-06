# == Schema Information
#
# Table name: addresses
#
#  id                :bigint           not null, primary key
#  address_line_1    :string(80)
#  address_line_2    :string(80)
#  addressable_type  :string           not null
#  city              :string(30)
#  country_region    :string(2)
#  zip_postal_code   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  addressable_id    :bigint           not null
#  state_province_id :bigint           not null
#
# Indexes
#
#  index_addresses_on_addressable_type_and_addressable_id  (addressable_type,addressable_id)
#  index_addresses_on_state_province_id                    (state_province_id)
#
# Foreign Keys
#
#  fk_rails_...  (state_province_id => state_provinces.id)
#
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :state_province

  delegate :name, to: :state_province, prefix: true

  private

  # Formats state_province as uppercase before saving to the database
end
