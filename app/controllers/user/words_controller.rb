class User::WordsController < ApplicationController

 before_action :authenticate_user!, except:[:index,:show,:destroy]

  def index
    @word = Word.new
    @words = Word.page(params[:page]).per(10).order(created_at: :desc)
    @page =  params[:page] ? (params[:page].to_i - 1) * 10 : 0
  end

  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
    if @word.save
      redirect_to words_path, notice: "単語を投稿しました。"
    else
      # @word = Word.new
      @page =  params[:page] ? (params[:page].to_i - 1) * 10 : 0
      @words = Word.page(params[:page]).per(10).order(created_at: :desc)
      render :index
      #renderを使う際、ビューの表示に必要なインスタンス変数を用意
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    @word.update(word_params)
    redirect_to word_path(@word), notice: "単語を編集しました。"
  end

  def destroy
     @word = Word.find(params[:id])

    if (user_signed_in? && @word.user_id == current_user.id) || admin_signed_in?
       @word.destroy
    end
    redirect_to words_path, notice: "単語を削除しました。"
  end


  def show
    @word = Word.find(params[:id])
    @example_sentence = ExampleSentence.new
    @example_sentences = @word.example_sentences
    @example_sentences_new = @word.example_sentences.last(1)
    @current_user = current_user
  end



  private

  def word_params
    params.require(:word).permit(:jp_word, :cn_word, :supplement, :jp_word_1, :pinyin, :genre_id, :name)
  end

end
