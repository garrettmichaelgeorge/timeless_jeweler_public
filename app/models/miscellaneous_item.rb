# == Schema Information
#
# Table name: miscellaneous_items
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint           not null
#
# Indexes
#
#  index_miscellaneous_items_on_item_id  (item_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#

class MiscellaneousItem < ApplicationRecord
  belongs_to :item, -> { miscellaneous_items }, inverse_of: :miscellaneous_item
end
