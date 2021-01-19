require_relative '../../test_helper_lite'
require_relative '../../../app/models/items/creator'

class TranslatorDouble
  def t(*) = ''
end

module Items
  describe Creator do
    let(:context) { MiniTest::Mock.new }
    let(:item_class) { MiniTest::Mock }
    let(:translator) { TranslatorDouble.new }
    subject do
      Creator.new(context: context,
                  attrs: {},
                  item_class: item_class,
                  translator: translator)
    end

    describe '#persist' do
      it 'notifies the context on success' do
        subject.item.expect(:save, true)

        expect_context_to_receive(:create_item_succeeded)
        subject.create!
        context.verify
      end

      it 'notifies the context on failure' do
        subject.item.expect(:save, false)

        expect_context_to_receive(:create_item_failed)
        subject.create!
        context.verify
      end
    end

    private

    def expect_context_to_receive(method)
      context.expect(method, nil) { |args| status_message_args_ok?(args) }
    end

    def status_message_args_ok?(args)
      args.count == 2
    end
  end
end
