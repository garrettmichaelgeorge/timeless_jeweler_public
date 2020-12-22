require 'test_helper'

describe ItemBuilder do
  before do
    # @item_attributes = FactoryBot.attributes_for(:item)
    @attributes = { name: 'my ring',
                    style_id: 3,
                    salable_type: 'Piece',
                    salable: { gemstones: [{ carat: 3.55 },
                                           { carat: 2.00 }],
                               metals: [{ category_id: 1,
                                          color_id: 3,
                                          purity_id: 1 },
                                        { category_id: 2,
                                          color_id: 2,
                                          purity_id: 1 }] } }

    @builder = described_class.new(@attributes)
  end

  describe '#persisted?' do
    it 'returns false' do
      _(@builder).wont_be :persisted?
    end
  end

  describe '#save' do
    it 'saves the objects in the correct order' do
      @builder.save
    end
  end
end
