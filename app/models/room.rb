# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_user_id :integer
#
class Room < ApplicationRecord #DM機能中間テーブル
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
end
