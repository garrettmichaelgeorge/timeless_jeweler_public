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

class MiscellaneousItem < Item
  has_one :profile, inverse_of: :miscellaneous_item, class_name: 'MiscellaneousItemProfile', foreign_key: 'item_id'
end
