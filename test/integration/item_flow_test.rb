require 'test_helper'
require 'test_helpers/eager_load'

class ItemFlowTest < ActionDispatch::IntegrationTest
  describe 'Creating a piece' do
    it 'works' do
      subject = Item.new(category: 'Piece')
      _(subject.class.name).must_equal 'Piece'
    end

    it 'saves the item' do
      subject = FactoryBot.build(:item, :piece)
      subject.category = 'Piece'
      subject.valid?

      _(subject.class.categories).must_include subject.category,
                                               save_failure_msg(subject)
      assert subject.save, save_failure_msg(subject)
    end
  end

  def save_failure_msg(subject)
    result = "Expected piece to save, but instead got the following errors:\n" \
             "#{subject.errors.messages}.\n"
    if subject.errors.messages.keys.include? :category
      result += "...\nNote: This could be because of known difficulties with Rails'\n" \
                "STI mechanism and constant loading. Start there with debugging.\n" \
                "#{subject.class.name}.categories #=> #{Item.categories}\n" \
                "subject.category #=> #{subject.category}.\n"
    end
    result
  end
end
