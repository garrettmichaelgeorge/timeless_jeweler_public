require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include Rails.application.routes.url_helpers

  let(:email) { I18n.t('mailer.example_email') }
  let(:full_name) { 'John Smith' }
  let(:user) { FactoryBot.create(:user, :unconfirmed, email: email) }
  let(:token) { user.confirmation_token }
  subject { described_class.confirmation_instructions(user, token) }

  describe '#confirmation_instructions' do
    it 'queues the email' do
      assert_emails 1 do
        subject.deliver_now
      end
    end

    it 'has the correct delivery address' do
    end

    it "contains the user's full_name in the message body" do
    end

    it 'contains a link to the confirmation url' do
    end

    it 'has the correct subject' do
      email_subject = confirmation_instructions_subject
    end
  end

  def confirmation_instructions_subject(translator = I18n)
    translator.t('devise.mailers.confirmation_instructions.subject')
  end
end
