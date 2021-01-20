class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'users/mailer'

  def confirmation_instructions(record, token, opts = {})
    super
  end
end
