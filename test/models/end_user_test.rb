# == Schema Information
#
# Table name: end_users
#
#  id                     :integer          not null, primary key
#  address                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  is_deleted             :boolean          default(FALSE)
#  last_name              :string
#  nickname               :string
#  postal_code            :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_end_users_on_email                 (email) UNIQUE
#  index_end_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class EndUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
