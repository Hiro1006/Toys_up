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
class PostComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :toy
end
