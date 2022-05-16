class Room < ApplicationRecord #DM機能中間テーブル
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
end
