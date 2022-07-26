class User::ProfilesController < ApplicationController

def edit
  @profile = current_user.profile_prepare
end

def update
  @profile = current_user.profile_prepare
  # 特定の物だけを変更（名前、性別、写真など）↓assign_attributes
  @profile.assign_attributes(profile_params)
  if @profile.save
  redirect_to users_profile_path, notice: 'プロフィール更新！'
  else
  flash.now[:error] = '更新できませんでした'
  render :edit
  end
end

def show
  # @user = current_user
  @user = User.find(params[:id])
  @profile = @user.profile
  @words = @user.words.page(params[:page]).per(10).order(created_at: :desc)
  @example_sentences = @user.example_sentences.page(params[:page]).per(10).order(created_at: :desc)
  @page =  params[:page] ? (params[:page].to_i - 1) * 10 : 0
  @page1 =  params[:page1] ? (params[:page1].to_i - 1) * 10 : 0
end

private

 def profile_params
    params.require(:profile).permit(:name,:introduction,:profile_image)
 end

end
