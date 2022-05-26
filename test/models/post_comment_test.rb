# == Schema Information
#
# Table name: post_comments
#
#  id          :integer          not null, primary key
#  comment     :text
#  star        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_user_id :integer
#  toy_id      :integer
#
require "test_helper"

class PostCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
