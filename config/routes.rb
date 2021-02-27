Rails.application.routes.draw do
  devise_for :users  # deviseをインストールすると自動で追記される
  root 'items#index' # トップページになるルートパスを設定

  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items, only: :order do  # 購入する商品のid情報を渡す
    post 'order', on: :member
  end
end

# 「member」とは、「resources以外のメソッドを追加したい」且つ「id情報を伴うURIを生成したい」時に使用する
