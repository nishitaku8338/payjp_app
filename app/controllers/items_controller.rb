class ItemsController < ApplicationController
  before_action :find_item, only: :order  # 「find_item」を動かすアクションを限定

  def index
    @items = Item.all  #「Item.all」として全商品の情報を取得する
  end

  def order # 購入する時のアクションを定義
    # 購入ボタンを押した際に、「current_userに紐付くcardが存在（present）していなければ、カードの新規登録画面にリダイレクトして実行（return）する」という処理を記述
    redirect_to new_card_path and return unless current_user.card.present?
  end

  private

  def find_item
    @item = Item.find(params[:id]) # 購入する商品を特定
  end
end
