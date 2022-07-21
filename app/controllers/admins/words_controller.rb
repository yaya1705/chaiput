class Admins::WordsController < ApplicationController
 before_action :authenticate_admin!
 layout 'dashboard/dashboard'
  def index
    @words = Word.all
  end


end
