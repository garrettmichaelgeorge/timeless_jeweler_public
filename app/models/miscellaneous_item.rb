# == Schema Information
#
# Table name: miscellaneous_items
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MiscellaneousItem < ApplicationRecord
  # Item subtype. Catch-all for handbags, etc. that aren't jewelry-related but are still sold in the store
  include Salable
end
