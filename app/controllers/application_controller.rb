class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  include Pundit
  include Punditable

  before_action :authenticate_user!

  protect_from_forgery prepend: true, with: :exception

  rescue_from ActionController::InvalidAuthenticityToken do
    redirect_to request.referrer, alert: t('devise.failure.timeout')
  end
end
