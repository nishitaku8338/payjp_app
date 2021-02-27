Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users  # deviseをインストールすると自動で追記される
  root 'items#index' # トップページになるルートパスを設定

  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end
