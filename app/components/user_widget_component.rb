class UserWidgetComponent < ApplicationComponent
  def render?
    controller.user_signed_in?
  end
end
