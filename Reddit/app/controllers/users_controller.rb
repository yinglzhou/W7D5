class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show, :index]

    def new
        render :new
    end

    def index
        @users = User.all

        if logged_in?
            render :index
        else
            redirect_to new_sessions_url
        end
    end

    def show
        @user = User.find_by(params[:id])

        if logged_in?
            render :show
        else
            redirect_to new_sessions_url
        end
    end


    def create
        @user = User.new(user_params)
        login(@user)
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
