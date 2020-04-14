class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :show, :update, :destroy]
    before_action :authorized


    def new
        @user = User.new()
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
    end

    def edit

    end

    def update
        @user.assign_attributes(user_params)
        if @user.valid?
            @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to login_path
    end

    def my_cart

    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :password)
    end

    def set_user
        @user = current_user
    end
end
