class User::ExampleSentencesController < ApplicationController

  # before_action :authenticate_any?, except:[:index]
  before_action :authenticate_user!, except:[:index,:destroy]
  def create
    @word = Word.find(params[:word_id])
    # @example_sentence_params = current_user.example_sentence.new(example_sentence_params)
    @example_sentence = ExampleSentence.new(example_sentence_params)
    @example_sentence.user_id = current_user.id
    @example_sentence.word_id = @word.id
    @example_sentence.save
    @example_sentences_new = @word.example_sentences.last(2)
    @example_sentences = @word.example_sentences
    # redirect_to word_path(@word)
  end

  def destroy
     @word = Word.find(params[:word_id])
     @example_sentence = ExampleSentence.find(params[:id])
     @example_sentence.destroy
    # redirect_to word_path(@word)
    @example_sentences_new = @word.example_sentences.last(1)
    # @current_user = current_user || current_admin
    @example_sentences = @word.example_sentences
  end

  def index

    @word = Word.find(params[:word_id])
    @example_sentences = @word.example_sentences.page(params[:page]).per(10).order(created_at: :desc)
    # current_user = current_user || current_admin

  end

  # def authenticate_any?
  #   if user_signed_in?
  #     authenticate_user!
  #   else
  #     authenticate_admin!
  #   end
  # end

  private

  def example_sentence_params
    params.require(:example_sentence).permit(:sentences, :sentences_jp)
  end
end
