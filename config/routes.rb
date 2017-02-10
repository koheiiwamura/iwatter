Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"
  resources :tweets, only: [:index, :create, :destroy]
  get 'users/search' => 'users/search#index'
  resources :users, only: :show do
    member do
      get :following, :followers
    end
  end
end
