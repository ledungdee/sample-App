class UsersController < ApplicationController
  def new
    @user = User.new 
  end
  def show
    @user=User.find(params[:id]) 
  end
  def create 
    @user= User.new(user_params)
    if @user.save 
      reset_session #Listing 8.40: Logging in the user upon signup.
      log_in @user  #Listing 8.40: Logging in the user upon signup.
      flash[:success] ="Welcome to the Sample App!"
      redirect_to @user # chuyen huong den ho so khi nguoi dung moi dc tao
      # Handle a successful save. 
    else
      render 'new', status: :unprocessable_entity 
    end 
  end
  private
    def  user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end
end