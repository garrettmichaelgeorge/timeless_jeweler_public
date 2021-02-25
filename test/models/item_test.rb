# == Schema Information
#
# Table name: items
#
#  id                       :bigint           not null, primary key
#  acquired_at              :datetime         not null
#  category                 :string(20)
#  cost_cents               :integer          default(0), not null
#  cost_currency            :string           default("USD"), not null
#  description              :text
#  name                     :string(40)       not null
#  notes                    :text
#  price_cents              :integer          default(0), not null
#  price_currency           :string           default("USD"), not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  item_ownership_status_id :bigint           not null
#  item_style_id            :bigint           not null
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_items_on_item_ownership_status_id  (item_ownership_status_id)
#  index_items_on_item_style_id             (item_style_id)
#  index_items_on_user_id                   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_ownership_status_id => item_ownership_statuses.id)
#  fk_rails_...  (item_style_id => item_styles.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  subject { build_stubbed(:item) }
  let(:ar) { subject }
  let(:attrs) { attributes_for(:item) }

  context 'associations' do
    should belong_to(:user).inverse_of(:items)
    should have_many(:line_items).inverse_of(:item)
    should belong_to(:style).inverse_of(:items)
    should belong_to(:ownership_status).inverse_of(:items)
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_length_of(:name).is_at_most(40)
    should validate_presence_of(:category)
    should validate_length_of(:category).is_at_most(20)
    should validate_inclusion_of(:category)
      .in_array(described_class.categories)
    should     allow_values('Piece', 'LooseGemstone').for(:category)
    should_not allow_values('wrongwrong!', 'invalid').for(:category)
  end

  context 'delegations' do
    should delegate_method(:name).to(:style).with_prefix
    should delegate_method(:code).to(:ownership_status).with_prefix
  end

  it 'monetizes the correct attributes' do
    assert_monetized subject, :price, :cost
  end

  describe '#category=' do
    it 'standardizes the input' do
      subject.category = 'piece'
      expected = 'Piece'
      _(subject.category).must_equal expected,
                                     'Input was not converted to standard format when setting the' \
                                     "attribute. Expected category to read back #{expected} but got" \
                                     "#{subject.category} instead"
    end
  end

  describe '.categories' do
    it 'returns an array of descendants' do
      %w[Piece LooseGemstone MiscellaneousItem].each do |category|
        _(described_class.categories).must_include category
      end
    end
  end

  describe '#child' do
    it 'returns the STI child class' do
      subject.category = 'Piece'

      _(subject.child).must_equal Piece
    end
  end

  describe '#acquired_at_year' do
    it 'returns the year as an integer' do
      subject.acquired_at = Time.new(2021)

      _(subject.acquired_at_year).must_equal 2021
    end
  end

  describe '#acquired_at_month' do
    it 'returns the month as an integer' do
      subject.acquired_at = Time.new(2021, 10)

      _(subject.acquired_at_month).must_equal 10
    end
  end
end
