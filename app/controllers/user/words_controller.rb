class User::WordsController < ApplicationController

  def index
    @word = Word.new
    @words = Word.page(params[:page]).per(10)
    @page =  params[:page] ? (params[:page].to_i - 1) * 10 : 0
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
    @word = Word.find(params[:id])
  end

  def update
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to words_path
  end


  def show
    @word = Word.find(params[:id])
    @example_sentence = ExampleSentence.new
    @example_sentences = @word.example_sentences
    @current_user = current_user || current_admin
  end



  private

  def word_params
    params.require(:word).permit(:jp_word, :cn_word, :supplement, :jp_word_1, :pinyin)
  end

end
