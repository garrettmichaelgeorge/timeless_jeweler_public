# == Schema Information
#
# Table name: gemstone_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gemstone::Category < ApplicationRecord
  self.table_name = 'gemstone_categories'

  has_many :gemstones, inverse_of: :subcategory

  validates :name, presence: true,
                   length: { maximum: 40 }
end
