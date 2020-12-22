require 'test_helper'
require 'item_validator'

describe ItemValidator do
  def validation_of(item)
    described_class.validate(item)
  end

  describe 'valid item' do
    before do
      @valid_item = FactoryBot.build(:item)
    end

    it 'is valid' do
      _(validation_of(@valid_item)).must_be :valid?
    end

    it 'does not return any messages' do
      _(validation_of(@valid_item).errors.messages).must_be_empty
    end
  end

  describe 'invalid item' do
    before do
      @invalid_item = Item.new
    end

    it 'is not valid' do
      _(validation_of(@invalid_item)).wont_be :valid?
    end

    it 'does return validation messages' do
      error_messages = validation_of(@invalid_item).errors.messages
      _(error_messages).wont_be_empty
    end

    it 'validates the name' do
      error_types = validation_of(@invalid_item).errors.keys
      _(error_types).must_include :name
    end
  end
end
