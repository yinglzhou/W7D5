class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if @user 
            login(@user)
            redirect_to user_url(@user.id)
        else
            flash
            render :new
        end
    end

    def destroy

    end
end
