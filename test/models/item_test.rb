# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  category       :string(20)
#  cost_cents     :integer          default(0), not null
#  cost_currency  :string           default("USD"), not null
#  description    :text
#  name           :string(40)       not null
#  notes          :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_style_id  :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#  index_items_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  subject { build_stubbed(:item) }
  let(:ar) { subject }
  let(:attrs) { attributes_for(:item) }

  context 'associations' do
    should belong_to(:user)
    should have_many(:line_items)
    should belong_to(:style)
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
      child1 = Class.new(described_class).to_s
      child2 = Class.new(described_class).to_s
      [child1, child2].each do |child|
        _(described_class.categories).must_include child,
                                                   'Expected ' \
                                                   "#{described_class}.categories " \
                                                   'to include the child class ' \
                                                   "#{child}, but it did not"
      end
    end
  end
end
