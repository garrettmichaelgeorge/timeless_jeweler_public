require 'test_helper'

class SKUIntegrationTest < ActionDispatch::IntegrationTest
  let(:subcategory) { build_stubbed :piece_subcategory }
  let(:acquired_at) { Time.new(2021, 1, 1) }
  let(:id) { 901 }
  let(:ownership_status) { build_stubbed :item_ownership_status, code: 'C' }
  subject do
    build_stubbed :piece,
                  id: id,
                  ownership_status: ownership_status,
                  acquired_at: acquired_at
  end

  before do
    subject.subcategory = subcategory
  end

  it 'generates the correct SKU' do
    actual = subject.sku
    expected = 'R21010901C'
    _(actual).must_equal expected,
                         "Expected SKU to equal #{expected}, but got #{actual} instead"
  end
end
