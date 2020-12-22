require 'test_helper'

describe MiscellaneousItemBuilder do
  setup do
    @attributes = FactoryBot.attributes_for(:item, :miscellaneous_item)
  end

  describe '.build' do
    it 'sets salable type to "Miscellaneous Item"' do
      item = described_class.build(**@attributes)
      _(item.salable_type).must_equal 'MiscellaneousItem'
    end
  end

  describe '.create!' do
    it 'creates a miscellaneous item' do
      assert_changes -> { Item.count } do
        described_class.create!(**@attributes)
      end
    end

    it 'sets the attributes' do
      item = described_class.create!(**@attributes)
      item.reload!
      assert item.attributes >= @attributes
    end
  end

  describe '#persist!' do
    it 'persists the record' do
      builder = described_class.new(**@attributes)
      assert builder.persist!
    end
  end
end
