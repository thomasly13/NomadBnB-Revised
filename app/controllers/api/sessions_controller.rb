class Api::SessionsController < ApplicationController

    def show 

        @user = @current_user 
        if @user 
            render 'api/users/show'
        else
            render json: { user: nil}
        end
    end

    def create 
        @user = User.find_by_credentials(params[:email], params[:password])
        if @user 
            login!(@user)
            render 'api/users/show'
        else
            render json: {errors: ['Invalid login credentials. Please try again.']}, status: 422
        end
    end 

    def destroy
        logout! 
        render json: {message: 'success'}
    end
    # private 

    # def user_params 
    #     params.require(:user).permit(:email, :password, :first_name, :last_name)
    # end
end
