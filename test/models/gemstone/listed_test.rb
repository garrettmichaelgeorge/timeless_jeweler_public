# == Schema Information
#
# Table name: gemstones
#
#  id                   :bigint           not null, primary key
#  carat                :decimal(, )
#  role                 :string(20)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  gemstone_category_id :bigint           not null
#
# Indexes
#
#  index_gemstones_on_gemstone_category_id  (gemstone_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_category_id => gemstone_categories.id)
#
require 'test_helper'

class Gemstone
  class ListedTest < ActiveSupport::TestCase
    subject { Gemstone::Listed.new }

    context 'associations' do
      should have_one(:listing)
    end

    describe '#listed?' do
      it 'returns true' do
        _(subject).must_be :listed?
      end
    end
  end
end
