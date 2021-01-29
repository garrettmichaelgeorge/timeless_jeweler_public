require_relative '../../test_helper_lite'
require_relative '../../../app/models/items/creator'

module Items
  describe Creator do
    let(:context) { MiniTest::Mock.new }
    let(:user) { MiniTest::Mock.new }
    let(:item) { MiniTest::Mock.new }
    let(:record_class) { MiniTest::Mock.new }
    subject do
      Creator.new(context: context,
                  attrs: {},
                  record_class: record_class)
    end

    before do
      context.expect(:current_user, user)
      record_class.expect(:new, item) do |arg1|
        arg1
      end
    end

    describe '#create!' do
      it 'notifies the context on success' do
        item.expect(:save, true)

        expect_context_to_receive(:create_item_succeeded)
        subject.create!
        context.verify
      end

      it 'notifies the context on failure' do
        item.expect(:save, false)

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
