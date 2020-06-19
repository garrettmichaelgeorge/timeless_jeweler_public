# == Schema Information
#
# Table name: store_transaction_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StoreTransactionCategory < ApplicationRecord
  has_many :store_transactions, inverse_of: "category"

  validates :name, uniqueness: true

  # FIXME: move view logic to helper
  def name_capitalized
    "#{name.capitalize}"
  end
end