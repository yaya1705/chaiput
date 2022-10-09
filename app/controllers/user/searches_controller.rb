class User::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    # LIKE句を使ったあいまい検索の構文
    # モデルクラス.where("列名 LIKE ?", "%値%")
   @example_sentences = ExampleSentence.where('sentences like ?', "%#{params[:word]}%").page(params[:page]).per(5)
   @words = Word.where('cn_word like ?', "%#{params[:word]}%").page(params[:page]).per(5)
  end
end
