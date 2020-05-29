# == Schema Information
#
# Table name: products
#
#  id                :bigint           not null, primary key
#  brand             :string(40)
#  cost              :decimal(10, 2)
#  description       :text
#  misc_measurements :text
#  name              :string(40)
#  price             :decimal(10, 2)
#  size              :decimal(7, 2)
#  size_unit         :string
#  weight            :decimal(7, 2)
#  weight_unit       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:rolex)
  end

  test 'should create new product' do
    @product = Product.new
    assert @product.save!
  end

  test 'should be valid' do
    assert @product.valid?
  end

end
