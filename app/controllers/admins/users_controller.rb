class Admins::UsersController < ApplicationController

 before_action :authenticate_admin!
# レイアウトメソッド
 layout 'dashboard/dashboard'

 def index
    @users = User.all
 end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_users_path, notice: '会員情報が更新されました'
    else
      flash.now[:alert] = '会員情報が更新できませんでした'
      render :edit
    end
  end
  
private

def user_params
    params.require(:user).permit(User.attribute_names)
end
end
