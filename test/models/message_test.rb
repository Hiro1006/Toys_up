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
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
