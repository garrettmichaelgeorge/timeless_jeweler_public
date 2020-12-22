require 'test_helper'

describe GemstoneBuilder do
  before do
    @attributes = FactoryBot.attributes_for(:item, :gemstone)
    @builder = described_class.new(**@attributes)
    @item = @builder.item
  end

  describe '.build' do
    it 'sets salable type to "Gemstone"' do
      _(@item.salable_type).must_equal 'Gemstone'
    end

    it 'sets the attributes' do
      assert @item.attributes >= @attributes
    end
  end
end
