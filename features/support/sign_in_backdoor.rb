# class Devise::SessionsController
#   def backdoor
#     sign_in(User.find_by_email(params[:email]))
#     redirect_to :root_path
#   end
# end

# TimelessJeweler::Application.routes.tap do |routes|
#   routes.disable_clear_and_finalize = true
#   routes.draw do
#     get 'backdoor', to: 'devise:sessions#backdoor'
#   end
# end
