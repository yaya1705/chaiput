class User::ExampleSentencesController < ApplicationController

  def create
    @word = Word.find(params[:word_id])
    # @example_sentence_params = current_user.example_sentence.new(example_sentence_params)
    @example_sentence = ExampleSentence.new(example_sentence_params)
    @example_sentence.user_id = current_user.id
    @example_sentence.word_id = @word.id
    @example_sentence.save
    redirect_to word_path(@word)
  end

  def destroy
     @word = Word.find(params[:word_id])
     @example_sentence = ExampleSentence.find(params[:id])
     @example_sentence.destroy
    redirect_to words_path
  end

  def index
    @word = Word.find(params[:word_id])
    @example_sentences = @word.example_sentences
    @current_user = current_user || current_admin
  end



  private

  def example_sentence_params
    params.require(:example_sentence).permit(:sentences, :sentences_jp)
  end
end
