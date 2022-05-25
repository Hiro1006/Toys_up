# == Schema Information
#
# Table name: toys
#
#  id          :integer          not null, primary key
#  caption     :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_user_id :integer
#  genre_id    :integer
#
require "test_helper"

class ToyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
