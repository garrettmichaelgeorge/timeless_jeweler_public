# == Schema Information
#
# Table name: gemstone_products
#
#  id                  :bigint           not null, primary key
#  gemstone_profile_id :bigint           not null
#  product_id          :bigint           not null
#
# Indexes
#
#  index_gemstone_products_on_gemstone_profile_id  (gemstone_profile_id)
#  index_gemstone_products_on_product_id           (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_profile_id => gemstone_profiles.id)
#  fk_rails_...  (product_id => products.id)
#
require 'test_helper'

class Product
  class GemstoneProductTest < ActiveSupport::TestCase
    context 'associations' do
      should belong_to(:profile)
        .dependent(:destroy)
        .autosave(true)
        .touch(true)
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
