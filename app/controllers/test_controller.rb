class TestController < ApplicationController
    def index 
    end

    def logout
        redirect_to new_user_session_path
    end
end
