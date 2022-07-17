class User::FavoritesController < ApplicationController

 def create
   @word = Word.find(params[:word_id])
   @example_sentence = @word.example_sentences.find(params[:example_sentence_id])
   @favorite = current_user.favorites.new(example_sentence_id: @example_sentence.id,word_id: @word.id)
   @favorite.save
#   redirect_to request.referer
 end


def destroy
  @word = Word.find(params[:word_id])
  @example_sentence = @word.example_sentences.find(params[:example_sentence_id])
  @favorite = current_user.favorites.find_by(example_sentence_id: @example_sentence.id,word_id: @word.id)
  @favorite.destroy
#   redirect_to request.referer
end
end
