class Api::UsersController < ApplicationController

    wrap_parameters include: User.attribute_names + ['password', 'firstName', 'lastName']

    def show 
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            render :show
        else
            render json: { errors: @user.errors }, status: 444
        end

    end

    def check 
        @user = User.find_by(email: params[:user][:email])
        if @user
            render json: { checkmark: 'Cool'}
        else 
            render json: { checkmark: 'Not Cool'}
        end
    end
    


    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :password)
    end
end

