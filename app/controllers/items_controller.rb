class ItemsController < ApplicationController
  def index
    @items = Item.all  #「Item.all」として全商品の情報を取得する
  end
end
