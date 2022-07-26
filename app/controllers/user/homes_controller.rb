class User::HomesController < ApplicationController

  def top
    @words = Word.last(4)
    @example_sentences = ExampleSentence.last(2)
  end
end
