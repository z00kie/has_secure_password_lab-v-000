class UsersController < ApplicationController
   def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to @user
            else
                redirect_to 'signup', alert: "Couldn't signup"
            end
        else
            redirect_to new_user_path, alert: "Couldn't signup"
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password)
    end
end
