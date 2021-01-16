require 'browser'

class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!, :current_browser

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    flash[:alert] = pundit_error_message_for(exception)
    redirect_to(request.referrer || root_path)
  end

  def pundit_error_message_for(exception)
    t error_message_path(exception), scope: 'pundit', default: :default
  end

  def error_message_path(exception)
    "#{policy_name_from(exception)}.#{query_from(exception)}"
  end

  def policy_name_from(exception)
    exception.policy.class.to_s.underscore
  end

  def query_from(exception)
    exception.query
  end

  def current_browser
    @browser = Browser.new(
      request.headers['User-Agent'],
      accept_language: request.headers['Accept-Language']
    )
  end
end
