require 'test_helper'

describe PieceBuilder do
  before do
    attributes = FactoryBot.attributes_for(:item, :as_piece)
    @builder = described_class.new
    @builder.assign_attributes(**attributes)
  end

  describe '#persist' do
    it 'saves the item' do
      assert_changes -> { Item.count } do
        @builder.persist
      end
    end
  end

  describe '#add_metal' do
    it 'adds a metal' do
      assert_changes -> { @builder.item.metals.count } do
        @builder.add_metal
      end
    end

    describe '#add_gemstone' do
      it 'adds a metal' do
        assert_changes -> { builder&.gemstones&.count } do
          @builder.add_gemstone
        end
      end
    end
  end
end
