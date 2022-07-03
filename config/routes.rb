Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions: "admin/sessions"
}
  devise_for :users,controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}
  scope module: :user do
    root to: 'homes#top'
    resources :words, only:[:index,:show,:new,:create,:destroy]
    resources :users, only:[:show,:edit,:update]
    resources :favorites, only:[:index,:create,:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
