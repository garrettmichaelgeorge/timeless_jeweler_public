require 'browser'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :current_browser

  private

  def current_browser
    @browser = Browser.new(
      request.headers['User-Agent'],
      accept_language: request.headers['Accept-Language']
    )
  end
end
