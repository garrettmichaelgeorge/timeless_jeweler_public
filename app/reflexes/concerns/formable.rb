module Formable
  extend ActiveSupport::Concern

  included do
    before_reflex do
      @auth_token = session['_csrf_token']
    end
  end
end
