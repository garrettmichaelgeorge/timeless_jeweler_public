class ApplicationController < ActionController::Base
  include Pundit
  include Punditable

  before_action :authenticate_user!
end
