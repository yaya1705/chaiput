class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @words = @user.words
  end

  def edit
  end
end
