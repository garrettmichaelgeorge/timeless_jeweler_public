class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  include Pundit
  include Punditable

  before_action :authenticate_user!
end
