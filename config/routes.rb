Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions: "admins/sessions",
  # registrations: "admins/registrations"
}
  devise_for :users,controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}

  scope module: :user do
    root to: 'homes#top'
    resources :words, only:[:index,:show,:new,:create,:edit,:update,:destroy]
    resources :users, only:[:show,:edit,:update]
    resource :favorites, only:[:create,:destroy]
    resource :book_marks, only:[:create,:destroy]
    resources :book_marks, only:[:index]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
