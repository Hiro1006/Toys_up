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
end
