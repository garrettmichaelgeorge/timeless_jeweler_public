# == Schema Information
#
# Table name: item_ownership_statuses
#
#  id         :bigint           not null, primary key
#  code       :string(1)        not null
#  name       :string(40)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item
  class OwnershipStatus < ApplicationRecord
    has_many :items, inverse_of: :ownership_status

    validates :name, presence: true,
                     uniqueness: true,
                     length: { maximum: 40 }

    validates :code, presence: true,
                     uniqueness: true,
                     length: { maximum: 1 }
  end
end
