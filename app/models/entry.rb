# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_user_id :integer
#  room_id     :integer
#
class Entry < ApplicationRecord #DM機能中間テーブル
  belongs_to :end_user
  belongs_to :room
end
