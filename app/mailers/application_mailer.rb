class ApplicationMailer < ActionMailer::Base
  default from: ->(mailer) { mailer.default_from }
  layout 'mailer'

  def default_from(translator = I18n)
    translator.t 'mailer.default_from'
  end
end
