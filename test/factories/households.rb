# == Schema Information
#
# Table name: households
#
#  id                 :bigint           not null, primary key
#  addresses_type     :string
#  anniversary        :date
#  email_address_type :string
#  household_name     :string(40)
#  phone_numbers_type :string
#  addresses_id       :bigint
#  email_address_id   :bigint
#  phone_numbers_id   :bigint
#
# Indexes
#
#  index_households_on_addresses_type_and_addresses_id          (addresses_type,addresses_id)
#  index_households_on_email_address_type_and_email_address_id  (email_address_type,email_address_id)
#  index_households_on_phone_numbers_type_and_phone_numbers_id  (phone_numbers_type,phone_numbers_id)
#
