# == Schema Information
#
# Table name: loose_gemstones
#
#  gemstone_id :bigint           not null
#  product_id  :bigint           not null
#
# Indexes
#
#  index_loose_gemstones_on_gemstone_id  (gemstone_id)
#  index_loose_gemstones_on_product_id   (product_id)
#
require 'test_helper'

class Product
  class GemstoneProductTest < ActiveSupport::TestCase
    context 'associations' do
      should belong_to(:gemstone)
      should belong_to(:product)
        .conditions(category: 'GEMSTONE')
    end

    context 'validations' do
    end

    context 'callbacks' do
      subject { FactoryBot.build(:gemstone_product) }

      should 'build new Gemstone object when saved' do
        subject.save
        _(subject.gemstone).must_exist
      end
    end
  end
end
