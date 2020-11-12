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
      should belong_to(:profile)
        .dependent(:destroy)
        .touch(true)
        .validate(true)
      should belong_to(:product)
        .conditions(category: 'GEMSTONE')
    end

    context 'validations' do
    end

    context 'delegations' do
      # 'delegate_missing_to' macro calls #public_send(<METHOD>), with the
      # delegate method sent as arguments
      should delegate_method(:public_send).to(:profile)
                                          .with_arguments(:carat)
    end

    context 'callbacks' do
      subject { FactoryBot.build(:gemstone_product, profile: nil) }

      should 'build new gemstone profile when saved' do
        subject.save
        _(subject.profile).wont_be_nil
      end
    end
  end
end
