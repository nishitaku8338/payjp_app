Rails.application.routes.draw do
  get 'items/index'
  devise_for :users  # deviseをインストールすると自動で追記される
  root 'items#index' # トップページになるルートパスを設定
end
