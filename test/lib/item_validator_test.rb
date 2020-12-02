require 'test_helper'
require 'item_validator'

describe ItemValidator do
  def validation_of(item)
    ItemValidator.validate(item)
  end

  describe 'valid item' do
    before do
      @valid_item = FactoryBot.build(:item)
    end

    it 'is valid' do
      _(validation_of(@valid_item)).must_be :okay?
    end

    it 'does not return any messages' do
      _(validation_of(@valid_item).messages).must_be_empty
    end
  end

  describe 'invalid movie' do
    before do
      @invalid_item = Item.new
    end

    it 'is not valid' do
      _(validation_of(@invalid_item)).wont_be :okay?
    end

    it 'does return validation messages' do
      _(validation_of(@invalid_item).messages).wont_be_empty
    end

    it 'validates the name' do
      _(validation_of(@invalid_item).messages).must_include "Name can't be empty."
    end
  end
end
