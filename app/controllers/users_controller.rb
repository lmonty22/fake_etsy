class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :show, :update, :destroy]

    def new
        @user = User.new()
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
    end

    def edit

    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        redirect_to login_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name)
    end

    def set_user
        @user = current_user
    end
end
