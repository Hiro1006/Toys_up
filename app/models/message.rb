class Message < ApplicationRecord #DM機能
  validates :message, presence: true
  belongs_to :end_user
  belongs_to :room
end
