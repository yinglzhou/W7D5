class UsersController < ApplicationController
    before_action :require_logged_in, only [:show, :index]

    def new
        render :new
    end


    def show

    end


    def create
        @user = User.find_by_credentials(user_params)
        login(@user)
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
