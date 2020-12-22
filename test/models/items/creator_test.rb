require 'test_helper'

describe Items::Creator do
  setup do
    @item_attributes = FactoryBot.attributes_for(:item)
  end

  it 'creates an item' do
    described_class.execute @item_attributes
    item = Item.first

    _(Item.count).must_equal 1

    @item_attributes.each_key do |attr_key|
      actual_attr = item.public_send(attr_key)
      expected_attr = @item_attributes[attr_key]

      _(actual_attr).must_equal expected_attr
    end
  end
end
