class Admins::WordsController < ApplicationController
 before_action :authenticate_admin!

  def index
    @words = Word.all
  end

 
end
