require_relative '../test_helper_pundit'
require_relative '../../app/policies/application_policy'
require_relative '../../app/policies/merchant_policy'

describe MerchantPolicy do
  let(:user)     { MiniTest::Mock.new }
  let(:merchant) { MiniTest::Mock.new }
  subject        { MerchantPolicy.new(user, merchant) }

  describe '#create, #new' do
    it 'denies access to clerks' do
      user.expect(:admin?, false)
      _(subject).must_permit :create
      _(subject).must_permit :new
    end

    it 'allows access to admins' do
      user.expect(:admin?, true)
      _(subject).must_permit :create
      _(subject).must_permit :new
    end
  end
end
