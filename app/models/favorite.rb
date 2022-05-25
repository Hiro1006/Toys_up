# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_user_id :integer
#  toy_id      :integer
#
class Favorite < ApplicationRecord
end
