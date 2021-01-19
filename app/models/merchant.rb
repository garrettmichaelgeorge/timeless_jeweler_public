# == Schema Information
#
# Table name: merchants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_merchants_on_name  (name) UNIQUE
#

class Merchant < ApplicationRecord
  has_many :admins, inverse_of: :merchant
  has_many :clerks, inverse_of: :merchant, class_name: 'Clerk'
  has_many :items, inverse_of: :merchant

  validates :name, presence: true,
                   uniqueness: true
end
