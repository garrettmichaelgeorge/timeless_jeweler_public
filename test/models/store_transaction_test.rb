# == Schema Information
#
# Table name: store_transactions
#
#  id                            :bigint           not null, primary key
#  transaction_datetime          :datetime
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  party_id                      :bigint           not null
#  store_transaction_category_id :bigint           not null
#
# Indexes
#
#  index_store_transactions_on_party_id                       (party_id)
#  index_store_transactions_on_store_transaction_category_id  (store_transaction_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (party_id => parties.id)
#  fk_rails_...  (store_transaction_category_id => store_transaction_categories.id)
#
require 'test_helper'

class StoreTransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @store_transaction = StoreTransaction.new
  end

  test "should not save without associated party_id" do
    @store_transaction.save
    p @store_transaction.errors.messages
    assert @store_transaction.errors.messages
  end
end
