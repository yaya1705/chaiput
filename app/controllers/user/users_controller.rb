class User::UsersController < ApplicationController
  
 before_action :set_user


  def show
    #@word = Word.find(params[:id])
    @words = @user.words.page(params[:page]).per(10).order(created_at: :desc)
    @page =  params[:page] ? (params[:page].to_i - 1) * 10 : 0
    @example_sentences = @user.example_sentences.page(params[:page1]).per(10).order(created_at: :desc)
    @page1 =  params[:page1] ? (params[:page1].to_i - 1) * 10 : 0
  end

  def favorites
    @favorites = @user.favorites.pluck(:example_sentence_id)
    @favorite_sentences = ExampleSentence.find(@favorites)

  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def withdrawal
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name,:email,:is_deleted,:profile_image)
  end
end
