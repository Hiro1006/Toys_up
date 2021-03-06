# == Schema Information
#
# Table name: end_users
#
#  id                     :integer          not null, primary key
#  address                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  is_deleted             :boolean          default(FALSE)
#  last_name              :string
#  nickname               :string
#  postal_code            :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_end_users_on_email                 (email) UNIQUE
#  index_end_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, {presence: true}
  validates :first_name, {presence: true}
  validates :nickname, {presence: true}
  validates :postal_code, {presence: true}
  validates :address, {presence: true}
  has_many :toys, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォロー機能
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロー機能

  has_many :followings, through: :relationships, source: :followed #フォ ロー機能
  has_many :followers, through: :reverse_of_relationships, source: :follower #フォロー機能

  has_many :messages, dependent: :destroy #DM機能
  has_many :entries, dependent: :destroy #DM機能

  def active_for_authentication?
    super && (is_deleted == false)
  end

  # フォローしたときの処理
  def follow(end_user_id)
    relationships.create(followed_id: end_user_id)
  end
  # フォローを外すときの処理
  def unfollow(end_user_id)
    relationships.find_by(followed_id: end_user_id).destroy
  end
  # フォローしているか判定
  def following?(end_user)
    followings.include?(end_user)
  end

   def self.search(search) #検索機能
    if search
      EndUser.where(['nickname LIKE ?', "%#{search}%"])
#Toyには検索したいテーブル、nameには検索したいカラム名を入力する
    else
      EndUser.all
#検索結果が当てはまらない場合は全て表示させる（必要ない場合は削除する）
    end
   end
end
