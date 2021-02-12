# == Schema Information
#
# Table name: miscellaneous_item_subcategories
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MiscellaneousItem
  class Subcategory < ApplicationRecord
    self.table_name = 'miscellaneous_item_subcategories'

    has_many :miscellaneous_items, inverse_of: :subcategory,
                                   class_name: 'MiscellaneousItem::Profile'
  end
end
