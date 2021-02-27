class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :card, dependent: :destroy
  # 「dependent: :destroyオプション」とは、親モデルが削除された時、それに紐付ている子モデルも一緒に削除されるというオプション
  #  「has_one」とは、アソシエーションが１対１の時に使用する。親モデル側に「has_one」を、子モデル側に「belongs_to」を記述する
end
