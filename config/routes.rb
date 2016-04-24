Rails.application.routes.draw do
  devise_for :users
  resources :visuals do
    resources :reviews
  end
  root 'visuals#index'
end
