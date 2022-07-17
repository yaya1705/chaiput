Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions: "admins/sessions",

  # registrations: "admins/registrations"
}
  devise_for :users,controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
}

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :user do
    root to: 'homes#top'
    resources :words, only:[:index,:show,:new,:create,:edit,:update,:destroy] do
    resources :example_sentences, only:[:create,:destroy,:index]do
    resource :favorites, only:[:create,:destroy]
  end
  end

    resource :users, only:[:show,:edit,:update] do
      patch "withdrawal" => "users#withdrawal"
     member do
    get "favorites"
    end
  end

    resource :book_marks, only:[:create,:destroy]
    resources :book_marks, only:[:index]
    get "search" => "searches#search"
  end

   namespace :admins do
     resources :words, only:[:index,:destroy]
     resources :users, only: [:index, :update,:edit]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
