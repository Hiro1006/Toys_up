# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  message     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_user_id :integer
#  room_id     :integer
#
class Message < ApplicationRecord #DM機能
  validates :message, presence: true
  belongs_to :end_user
  belongs_to :room
end
