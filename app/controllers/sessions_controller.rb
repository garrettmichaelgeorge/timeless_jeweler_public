class SessionsController < ApplicationController
    def new
        render layout: 'login'
    end
end
