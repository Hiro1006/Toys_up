class Toy < ApplicationRecord
  has_one_attached:image

  belongs_to :genre
  belongs_to :end_user

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

  validates :name,presence:true
  validates :caption,presence:true,length:{maximum:200}

   def self.search(search) #検索機能
    if search
      Toy.where(['name LIKE ? OR caption LIKE ?', "%#{search}%", "%#{search}%"])
#Toyには検索したいテーブル、nameには検索したいカラム名を入力する
    else
      Toy.all
#検索結果が当てはまらない場合は全て表示させる（必要ない場合は削除する）
    end
   end
end
