class ItemsController < ApplicationController
  before_action :find_item, only: :order  # 「find_item」を動かすアクションを限定

  def index
    @items = Item.all  #「Item.all」として全商品の情報を取得する
  end

  def order # 購入する時のアクションを定義
    # 購入ボタンを押した際に、「current_userに紐付くcardが存在（present）していなければ、カードの新規登録画面にリダイレクトして実行（return）する」という処理を記述
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
      )
  end

  private

  def find_item
    @item = Item.find(params[:id]) # 購入する商品を特定
  end
end

# Chargeオブジェクト
# 「Chargeオブジェクト」とは、PAY.JP側であらかじめ用意されている支払い情報を生成するオブジェクト
# 「Payjp::Charge.create」と記述することで利用する事ができる

# PAY.JPの支払い機能を利用するには、まずは環境変数を読み込む必要がある
# 次に、カード情報を受け取るために、PAY.JP側に送るトークンを定義する
# 最後に、「Payjp::Charge.create」として、支払い情報を生成する
# jpyは「japanese yen」の略称で、「日本円」を意味する