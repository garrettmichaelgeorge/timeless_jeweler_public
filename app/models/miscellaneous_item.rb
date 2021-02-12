# == Schema Information
#
# Table name: items
#
#  id                       :bigint           not null, primary key
#  acquired_at              :datetime         not null
#  category                 :string(20)
#  cost_cents               :integer          default(0), not null
#  cost_currency            :string           default("USD"), not null
#  description              :text
#  name                     :string(40)       not null
#  notes                    :text
#  price_cents              :integer          default(0), not null
#  price_currency           :string           default("USD"), not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  item_ownership_status_id :bigint           not null
#  item_style_id            :bigint           not null
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_items_on_item_ownership_status_id  (item_ownership_status_id)
#  index_items_on_item_style_id             (item_style_id)
#  index_items_on_user_id                   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_ownership_status_id => item_ownership_statuses.id)
#  fk_rails_...  (item_style_id => item_styles.id)
#  fk_rails_...  (user_id => users.id)
#

class MiscellaneousItem < Item
  has_one :profile, inverse_of: :item, foreign_key: 'item_id',
                    dependent: :destroy, autosave: true

  # Must include Profilable after defining :profile association
  include Profilable

  class Profile < ApplicationRecord
    self.table_name = 'miscellaneous_items'

    belongs_to :item, inverse_of: :profile, class_name: 'MiscellaneousItem', foreign_key: 'item_id'
    belongs_to :subcategory, inverse_of: :miscellaneous_items, foreign_key: 'miscellaneous_item_subcategory_id'
  end
end
