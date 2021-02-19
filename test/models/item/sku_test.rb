require_relative '../../test_helper_lite'
require_relative '../../../app/models/item/sku'

class Item
  describe SKU do
    let(:acquired_at) { Time.new(2021, 1) }
    let(:ownership_status_code) { 'C' }
    let(:subcategory_code) { 'B' }
    let(:id) { 901 }
    let(:skuable_class) do
      Struct.new(:subcategory_code, :acquired_at, :id, :ownership_status_code)
    end
    let(:skuable) do
      skuable_class.new(subcategory_code, acquired_at, id, ownership_status_code)
    end

    subject { SKU.new(context: skuable) }

    describe '#sku' do
      it 'generates the correct string' do
        _(subject.sku).must_equal 'B21010901C'

        skuable.id = 1
        _(subject.sku).must_equal 'B21010001C'

        skuable.id = 9999
        _(subject.sku).must_equal 'B21019999C'

        skuable.acquired_at = Time.new(12, 12)
        _(subject.sku).must_equal 'B12129999C'

        skuable.subcategory_code = 'BR'
        _(subject.sku).must_equal 'BR12129999C'
      end

      it 'returns a string with the right number of characters' do
        expected_low = 10
        expected_high = 11
        actual = subject.sku.length
        msg = "SKU must be between #{expected_low} and #{expected_high} characters, but this SKU was #{actual} characters instead"

        _(actual).must_be :>=, expected_low, msg
        _(actual).must_be :<=, expected_high, msg
      end

      it 'is formatted correctly' do
        regex = /
          \A             # -- start
          ([RNPBREW]|BR) # item type code
          \d{2}          # 2-digit year
          \d{2}          # 2-digit month
          \d{4}          # 4-digit item no.
          [TC]           # owned or consigned
          \z             # -- end
        /x

        _(subject.sku).must_match regex,
                                  "SKU '#{subject.sku}' was formatted incorrectly. It should conform to the following regex"
      end
    end

    describe '#==(other)' do
      it 'returns true when the skus are equal' do
        equal_other = subject.dup

        _(subject).must_be :==, equal_other
      end

      it 'returns false when the skus are not equal' do
        subject

        acquired_at = Time.new(2021, 2)
        different_skuable = skuable_class.new(subcategory_code, acquired_at, id, ownership_status_code)
        different_other = SKU.new(context: different_skuable)

        _(subject).wont_be :==, different_other
      end
    end
  end
end
