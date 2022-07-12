class Admins::WordsController < ApplicationController

  def index
    @words = Word.all
  end
end
