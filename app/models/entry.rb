class Entry < ApplicationRecord #DM機能中間テーブル
  belongs_to :end_user
  belongs_to :room
end
