# == Schema Information
#
# Table name: people
#
#  id                    :bigint           not null, primary key
#  birthday              :date
#  first_name            :string(40)
#  last_name             :string(40)
#  necklace_length       :decimal(4, 2)
#  necklace_length_notes :text
#  ring_size             :decimal(4, 2)
#  ring_size_notes       :text
#  suffix                :string(20)
#  title                 :string(20)
#  household_id          :bigint
#
# Indexes
#
#  index_people_on_household_id  (household_id)
#
# Foreign Keys
#
#  fk_rails_...  (household_id => households.id)
#
