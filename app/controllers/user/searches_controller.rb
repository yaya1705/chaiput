class User::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search

    example_sentences = ExampleSentence.where('sentences like ?', "%#{params[:word]}%")
    @words = Word.where('cn_word like ?', "%#{params[:word]}%").or(
      Word.where(id: example_sentences.pluck(:word_id))
    )

    # @range = params[:range]
    # if @range == "Word"
    #   @words = Word.looks(params[:word])
    # else
    #   @example_sentences = ExampleSentence.looks(params[:search], params[:word])
    # end
  end
end
