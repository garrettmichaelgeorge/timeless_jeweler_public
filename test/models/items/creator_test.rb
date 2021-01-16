require_relative '../../test_helper_lite'

class ItemDouble
  def initialize(*); end

  def save
    true
  end
end

describe Items::Creator do
  let(:context) { MiniTest::Mock.new }
  let(:item_class) { ItemDouble }
  let(:item) { item_class.new }
  subject do
    item_class.stub :new, item do
      Items::Creator.new(context: context,
                         item_class: item_class)
    end
  end

  describe '#persist' do
    it 'notifies the context on success' do
      context.expect(:create_item_succeeded, nil) do |args|
        correct_notification_sent?(args)
      end
      subject.persist!
      context.verify
    end

    it 'notifies the context on failure' do
      item.stub :save, false do
        context.expect(:create_item_succeeded, nil) do |args|
          correct_notification_sent?(args)
        end
        subject.persist!
        context.verify
      end
    end
  end

  def correct_notification_sent?(args)
    args[:item].is_a?(ItemDouble) && args[:msg].is_a?(String)
  end
end
