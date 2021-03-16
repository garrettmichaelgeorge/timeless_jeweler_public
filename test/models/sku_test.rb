require_relative '../test_helper_lite'
require_relative '../../app/models/sku'
require_relative '../../app/models/skuable_double'

describe SKU do
  let(:time_class) { Time }
  let(:acquired_at) { time_class.new(2021, 1) }
  let(:ownership_status_code) { 'C' }
  let(:subcategory_code) { 'B' }
  let(:id) { 901 }
  let(:skuable_double) { build_skuable_double }

  def build_skuable_double(skuable_class = SKUableDouble)
    skuable_class.new(subcategory_code: subcategory_code,
                      acquired_at: acquired_at,
                      id: id,
                      ownership_status_code: ownership_status_code)
  end

  subject { SKU.new(context: skuable_double) }

  describe '#sku' do
    it 'generates the correct string based on its context' do
      _(subject.sku).must_equal 'B21010901C'

      skuable_double.id = 1
      _(subject.sku).must_equal 'B21010001C'

      skuable_double.id = 9999
      _(subject.sku).must_equal 'B21019999C'

      skuable_double.acquired_at = time_class.new(2012, 12)
      _(subject.sku).must_equal 'B12129999C'

      skuable_double.subcategory_code = 'BR'
      _(subject.sku).must_equal 'BR12129999C'
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
      other = subject.dup

      _(subject).must_be :==, other
    end

    it 'returns false when the skus are not equal' do
      subject

      other_skuable = skuable_double.dup
      other_skuable.acquired_at = time_class.new(2021, 2)

      other = SKU.new(context: other_skuable)

      _(subject).wont_be :==, other
    end
  end
end
