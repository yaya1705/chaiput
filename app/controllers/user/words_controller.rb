class User::WordsController < ApplicationController

  def index
    @word = Word.new
    @words = Word.all
  end

  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
    if @word.save
      redirect_to words_path, notice: "You have created book successfully."
    else
      #renderを使う際、ビューの表示に必要なインスタンス変数を用意
      @words.all
      render :index
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  

  def show
    @word = Word.find(params[:id])
  end

  private

  def word_params
    params.require(:word).permit(:jp_word, :cn_word, :supplement)
  end
end
